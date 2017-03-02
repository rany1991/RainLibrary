package org.easily.debug
{
	import r1.deval.D;

	/**
	 * @author Easily
	 */
	public class Eval2
	{
		public static function doString(program:*, context:Object=null, thisObj:Object=null):Object
		{
			try
			{
				return D.eval(program, context, thisObj);
			}
			catch (error:Error)
			{
				Log.print(error.message);
			}
			return null;
		}
	}
}
