package org.easily.utils
{
	import flash.utils.getQualifiedClassName;
	
	/**
	 * @author Easily
	 */
	public class ClassUtils
	{
		public static function getClassName(obj:Object):String
		{
			var qualifiedName:String = getQualifiedClassName(obj);
			var className:String;
			var index:int = qualifiedName.indexOf("::");
			if (index != -1)
			{
				className = qualifiedName.substring(index + 2);
			}
			else
			{
				className = qualifiedName;
			}
			return className;
		}
		
		public static function getClassRef(obj:Object):Class
		{
			var className:String = getQualifiedClassName(obj);
			var clsRef:Class = Class(DomainUtils.getClass(className));
			return clsRef;
		}
		
		public static function getInstance(clsName:String):*
		{
			var clsRef:Class = DomainUtils.getClass(clsName);
			return new clsRef;
		}
	}
}