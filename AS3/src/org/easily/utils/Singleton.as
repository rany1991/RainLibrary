package org.easily.utils
{
	import flash.utils.Dictionary;
	
	/**
	 * @author Easily
	 */
	public class Singleton
	{
		private static var clsMap:Dictionary = new Dictionary(true);
		
		//将一个实例和他的类引用映射		
		public static function put(instance:Object):void
		{
			var clsRef:Class = ClassUtils.getClassRef(instance);
			putEx(clsRef, instance);
		}
		
		public static function remove(instance:Object):void
		{
			var clsRef:Class = ClassUtils.getClassRef(instance);
			removeEx(clsRef, instance);
		}
		
		//这个方法中，实例可能是该类的派生类的实例
		public static function putEx(clsRef:Class, instance:Object):void
		{
			if (!clsMap[clsRef])
			{
				clsMap[clsRef] = instance;
			}
			else
			{
				throw new Error("Class " + clsRef + " already constructed!");
			}
		}
		
		public static function removeEx(clsRef:Class, instance:Object):void
		{
			delete clsMap[clsRef];
		}
		
		public static function get(clsRef:Class):Object
		{
			return clsMap[clsRef];
		}
	}
}
