package org.easily.utils
{
	import flash.utils.Dictionary;
	
	/**
	 * @author Easily
	 */
	public class DictionaryUtils
	{
		public static function getKeys(dic:Dictionary):Array
		{
			var array:Array = [];
			for (var key:* in dic)
			{
				array.push(key);
			}
			return array;
		}
		
		public static function getValues(dic:Dictionary):Array
		{
			var array:Array = [];
			for each (var value:* in dic)
			{
				array.push(value);
			}
			return array;
		}
		
		public static function getPairs(dic:Dictionary):Array
		{
			var array:Array = [];
			for (var key:* in dic)
			{
				array.push({key:key, value:dic[key]});
			}
			return array;
		}
		
		public static function dispose(dic:Dictionary):void
		{
			for each (var key:* in getKeys(dic))
			{
				dic[key] = null;
				delete dic[key];
			}
		}
		
		public static function clear(dic:Dictionary):void
		{
			dispose(dic);
		}
	}
}