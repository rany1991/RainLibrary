package org.easily.utils
{
	import flash.utils.getDefinitionByName;
	
	import org.easily.debug.Log;

	/**
	 * @author Easily
	 */
	public class DomainUtils 
	{
		private static var clsMap:Array = [];
		
		public static function getClass(name:String):Class
		{
			var clsRef:Class = clsMap[name];
			if (clsRef)
			{
				return clsRef;
			}
			try	
			{
				clsRef = getDefinitionByName(name) as Class;
				clsMap[name] = clsRef;
			}
			catch (e:Error)
			{
				Log.print("DomainUtils.getClass:" + e.message);
			}
			return clsRef;
		}
		
		public static function getInstance(name:String):*
		{
			var clsRef:Class = getClass(name);
			if (clsRef)
			{
				return new clsRef;
			}
			return null;
		}
	}
}
