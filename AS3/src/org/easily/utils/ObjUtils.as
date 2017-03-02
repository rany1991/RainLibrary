package org.easily.utils
{
	public class ObjUtils
	{
		public static function toString(obj:Object, sep:String = ","):String
		{
			var str:String = "";
			var list:Array = getKeys(obj);
			var len:int = list.length;
			var last:int = len - 1;
			for (var i:int = 0; i < len; i++) 
			{
				var key:Object = list[i];
				str += key + "=" + obj[key];
				if (i < last)
				{
					str += sep;
				}
			}
			return str;
		}

		public static function getKeys(obj:Object):Array
		{
			var list:Array = [];
			for (var key:Object in obj)
			{
				list.push(key);
			}
			return list;
		}

		public static function clone(obj:Object):Object
		{
			var obj_:Object = {};
			for (var key:Object in obj)
			{
				obj_[key] = obj[key];
			}
			return obj_;
		}

		public static function merge(...args):Object
		{
			var obj_:Object = {};
			for each (var obj:Object in args)
			{
				for (var key:Object in obj)
				{
					obj_[key] = obj[key];
				}
			}
			return obj_;
		}

		public static function copy(source:Object, target:Object = null):Object
		{
			target ||= {}
			for (var key:Object in source)
			{
				target[key] = source[key]
			}
			return target;
		}
	}
}