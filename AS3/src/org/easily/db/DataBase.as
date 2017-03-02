package org.easily.db
{
	import com.maclema.mysql.Connection;
	import com.maclema.mysql.Field;
	import com.maclema.mysql.MySqlToken;
	import com.maclema.mysql.ResultSet;
	import com.maclema.mysql.Statement;
	
	import flash.events.Event;
	
	import org.easily.db.AsyncResponder;
	import org.easily.debug.Log;

	/**
	 * @author Easily
	 */
	public class DataBase
	{
		public var connData:ConnectData;
		public var conn:Connection;
		
		public function DataBase(database:ConnectData)
		{
			connData = database;
		}
		
		public function connect(connFunc_:Function = null):void
		{
			conn = new Connection(connData.host, connData.port, connData.username, connData.password, connData.database);
			conn.addEventListener(Event.CONNECT, onConnected);
			conn.connect();
			
			function onConnected(event:Event):void
			{
				conn.removeEventListener(Event.CONNECT, onConnected);
				if (connFunc_ != null)
				{
					connFunc_();
				}
			}
		}
		
		public function disconnect():void
		{
			conn.disconnect();
		}
		
		public function select(sql:String, compFunc_:Function, errorFunc_:Function = null):void
		{
			var st:Statement = conn.createStatement();
			var token:MySqlToken = st.executeQuery(sql);
			var responder:AsyncResponder = new AsyncResponder(resultHandler, faultHandler, token);
			token.addResponder(responder);
			
			function resultHandler(result:Object/*ResultSet*/, token:Object/*MySqlToken*/):void
			{
				var arr:Array = [];
				if (result is ResultSet)
				{
					var fieldList:Array = result.getColumns();
					while (result.next())
					{
						var item:Object = {};
						for each (var field:Field in fieldList)
						{
							item[field.getName()] = result.getString(field.getName());
						}
						arr.push(item);
					}
				}
				
				compFunc_(arr);
			}
			
			function faultHandler(info:Object, token:Object):void
			{
				Log.print(info);
				if (errorFunc_ != null)
				{
					errorFunc_();
				}
			}
		}
		
		public function insert(sql:String, compFunc_:Function, errorFunc_:Function = null):void
		{
			var st:Statement = conn.createStatement();
			var token:MySqlToken = st.executeQuery(sql);
			var responder:AsyncResponder = new AsyncResponder(resultHandler, faultHandler, token);
			token.addResponder(responder);
			
			function resultHandler(result:Object/*MySqlResponse*/, token:Object/*MySqlToken*/):void
			{
				compFunc_(result.insertID);
			}
			
			function faultHandler(info:Object, token:Object):void
			{
				Log.print(info);
				if (errorFunc_ != null)
				{
					errorFunc_();
				}
			}
		}
		
		public function remove(sql:String, compFunc_:Function, errorFunc_:Function = null):void
		{
			var st:Statement = conn.createStatement();
			var token:MySqlToken = st.executeQuery(sql);
			var responder:AsyncResponder = new AsyncResponder(resultHandler, faultHandler, token);
			token.addResponder(responder);
			
			function resultHandler(result:Object/*MySqlResponse*/, token:Object/*MySqlToken*/):void
			{
				compFunc_();
			}
			
			function faultHandler(info:Object, token:Object):void
			{
				Log.print(info);
				if (errorFunc_ != null)
				{
					errorFunc_();
				}
			}
		}
		
		public function dispose():void
		{
			disconnect();
			conn = null;
		}
	}
}
