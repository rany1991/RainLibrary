package org.easily.utils
{
	import flash.geom.Point;
	
	import org.easily.debug.XPerf;
	
	/**
	 * @author Easily
	 */
	public class Offsets
	{
		public static const SIZE:int = 10;
		
		public static var list:Array = init();
		
		public static function init():Array
		{
			list = [];
			for (var x:int = -SIZE; x <= SIZE; ++x)
			{
				for (var y:int = -SIZE; y <= SIZE; ++y)
				{
					list.push(new Point(x, y));
				}
			}
			
			XPerf.perf("Offsets.init");
			ArrayUtils.quickSort(list, compFunc);
			XPerf.stop();
			function compFunc(p1:Point, p2:Point):Boolean
			{
				return p1.length > p2.length;
			}
			
			return list;
		}
	}
}
