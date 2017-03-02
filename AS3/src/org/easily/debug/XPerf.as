package org.easily.debug
{
	import flash.utils.getTimer;
	
	/**
	 * @author Easily
	 */
	public class XPerf
	{
		private static var data:Array = [];

		public static function perf(name:String):void
		{
			var obj:Object = {name:name, time:getTimer()};
			data.push(obj);
		}

		public static function stop():void
		{
			var obj:Object = data.pop();
			if (obj)
			{
				var len:int = data.length;
				var t:String = "";
				for (var i:int = 0; i < len; i++)
				{
					t += "> ";
				}
				Log.print("Perf:" + t + obj.name + "=" + (getTimer() - obj.time) + " ms");
			}
		}
	}
}
