package org.easily.utils
{
	import flash.utils.Dictionary;

	public class IDUtils
	{
		private static var idMap:Dictionary = new Dictionary;
		
		public static function genID(key:String = ""):uint
		{
			var id:uint = idMap[key];
			idMap[key] = ++id;
			return id;
		}
	}
}