package org.easily.utils
{
	/**
	 * @author Easily
	 */
	public class FunctionUtils
	{
		public static function call(func:Function, ...args):void
		{
			if (func is Function)
			{
				func.apply(null, args);
			}
		}
		
		public static function empty(...args):void
		{
		}
	}
}