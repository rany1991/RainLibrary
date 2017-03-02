package org.easily.local
{
	import flash.net.SharedObject;
	
	import org.easily.debug.Log;

	public class LocalStorage
	{
		public var so:SharedObject;
		public var data:Object;
		
		public function LocalStorage(name:String)
		{
			try
			{
				so = SharedObject.getLocal(name);
				data = so.data;
			}
			catch(error:Error)
			{
				Log.print("SharedObject.getLocal error !!! name="+name);
			}
		}
		
		public function getData(url:String, version:uint):*
		{
			try
			{
				var obj:Object = data[url];
				if (obj && obj.version == version)
				{
					return obj.content;
				}
			}
			catch(error:Error)
			{
				Log.print("LocalStorage.getData eror !!! url="+url + ",version="+version);
			}
			return null;
		}
		
		public function saveData(url:String, verison:uint, content:*):void
		{
			try
			{
				data[url] = {version:verison, content:content};
				flushData();
			}
			catch(error:Error)
			{
				Log.print("LocalStorage.saveData eror !!! url="+url + ",version="+verison);
			}
		}
		
		public function flushData():void
		{
			try
			{
				so.flush();
			}
			catch(error:Error)
			{
				Log.print("SharedObject.flush error !!!");
			}
		}
	}
}