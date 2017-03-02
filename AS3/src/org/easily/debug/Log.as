package org.easily.debug
{
	import com.hexagonstar.util.debug.Debug;
	
	import flash.utils.getTimer;
	
	/**
	 * @author Easily
	 */
	public class Log
	{
		public static var enabled:Boolean = true;
		
		public static function print(...args):void
		{
			if (enabled)
			{
				var msg:String = getTimer().toString() + " :";
				var args_:Array = [msg].concat(args);
				trace.apply(null, args_);
				Debug.trace.apply(null, args_);
			}
		}
	}
}