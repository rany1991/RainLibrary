package org.rany.utils
{
	import flash.net.LocalConnection;
	import flash.net.registerClassAlias;
	import flash.utils.ByteArray;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	public class Util
	{
		public function Util()
		{
		}
		
		public static function getUrlFileName(url:String):String
		{
			var pos:int = url.lastIndexOf("/");
			var subUrl:String = url.substr(pos + 1);
			var ary:Array = subUrl.split(".");
			return ary[0];
		}
		
		public static function hackGC():void
		{
			try
			{
				var lc1:LocalConnection = new LocalConnection();
				var lc2:LocalConnection = new LocalConnection();
				lc1.connect("gc");
				lc2.connect("gc");
			}
			catch(e:Error)
			{
				
			}
		}
		
		/**
		 * 插入排序
		 * */
		public static function insertionSort(ary:Array):Array
		{
			var i:int;
			for(var j:int = 2; j < ary.length; j ++)
			{
				var key:* = ary[j];
				i = j - 1;
				while(i > 0 && ary[i] > key)
				{
					ary[i + 1] = ary[i];
					i --;
					ary[i + 1] = key;
				}
			}
			return ary;
		}
		
		/**
		 * Divide and Conquer
		 * */
		public static function divideConquerSort():void
		{
			
		}
		/**
		 * 随机排序		
		 * */
		public static function randomSort(ary:Array):Array
		{
			var outputArr:Array = ary.slice(); 
			var i:int = outputArr.length; 
			while (i) 
			{ 
				outputArr.push(outputArr.splice(int(Math.random() * i--), 1)); 
			} 
			return outputArr;
		}
		
		/**
		 * 深复制对象
		 * */
		public static function cloneObject(obj:Object):Object
		{
			var cls:String = getQualifiedClassName(obj);
			var objType:Class = getDefinitionByName(cls) as Class;
			registerClassAlias(cls, objType);
			var bt:ByteArray = new ByteArray();
			bt.writeObject(obj);
			bt.position(0);
			return bt.readObject();
		}
	}
}