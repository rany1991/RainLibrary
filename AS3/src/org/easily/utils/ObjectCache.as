package org.easily.utils
{
	import flash.utils.Dictionary;
	
	/**
	 * @author Easily
	 */
	public class ObjectCache
	{
		private static var clsMap:Dictionary = new Dictionary();
		
		public static function getObject(clsRef:Class):Object
		{
			var data:Object = clsMap[clsRef];
			if (!data)
			{
				data = {usable:[], using:[]};
				clsMap[clsRef] = data;
			}
			
			var obj:Object
			if (data.usable.length)
			{
				obj = data.usable.pop();
			}
			else
			{
				obj = new clsRef();
			}
			
			data.using.push(obj);
			return obj;
		}
		
		public static function releaseObject(clsRef:Class, obj:Object):void
		{
			var data:Object = clsMap[clsRef];
			if (data)
			{
				ArrayUtils.remove(data.using, obj);
				data.usable.push(obj);
			}
		}
	}
}