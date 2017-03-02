package org.easily.ticker
{
	import flash.utils.Dictionary;
	
	import org.easily.utils.FunctionUtils;

	public class FrameTicker extends Ticker
	{
		public var totalCount:int;
		public var tickCount:int;
		public var frequency:int;
		public var repeatCount:int;
		
		public function FrameTicker(frequency_:int = 1, repeatCount_:int = 0, timerFunc_:Function = null, compFunc_:Function = null)
		{
			super(timerFunc_, compFunc_);
			
			frequency = Math.max(1, frequency_);
			repeatCount = Math.max(0, repeatCount_);
			reset();
		}
		
		override public function reset():void
		{
			tickCount = 0;
		}

		override public function doTick(dtime:Number):void
		{
			++tickCount;
			if (tickCount == frequency)
			{
				tickCount = 0;
				++totalCount;
				if (timerFunc != null)
				{
					timerFunc(dtime);
				}
				if (repeatCount > 0 && totalCount >= repeatCount)
				{
					if (compFunc != null)
					{
						compFunc();
					}
					dispose();
				}
			}
		}
		
		//实用的静态方法
		private static const NAME:String = "frameTicker";
		private static var tickerMap:Dictionary = new Dictionary();
		
		//设置一个以帧率计算的回调 
		public static function setInterval(compFunc:Function, frequency:int = 1):uint
		{
			var ticker:FrameTicker = new FrameTicker(frequency, 0, compFunc);
			ticker.start();
			
			var id:uint = TickerUtils.genID(NAME);
			tickerMap[id] = ticker;
			ticker.id = id;
			return id;
		}
		
		//同上,callback不带参
		public static function setIntervalEx(compFunc:Function, frequency:int = 1):uint
		{
			var ticker:FrameTicker = new FrameTicker(frequency, 0, update);
			ticker.start();
			function update(dtime:Number):void
			{
				compFunc();
			}
			
			var id:uint = TickerUtils.genID(NAME);
			tickerMap[id] = ticker;
			ticker.id = id;
			return id;
		}
		
		public static function clearInterval(id:uint):void
		{
			if (id > 0)
			{
				var ticker:FrameTicker = tickerMap[id];
				if (ticker)
				{
					ticker.dispose();
					delete tickerMap[id];
				}
			} 
		}
		
		public static function setTickout(callback:Function, tick:int = 1):uint
		{
			var ticker:FrameTicker = new FrameTicker(tick, 1, callback);
			ticker.start();
			
			var id:uint = TickerUtils.genID(NAME);
			tickerMap[id] = ticker;
			ticker.id = id;
			return id;
		}
		
		public static function clearTickout(id:uint):void
		{
			if (id > 0)
			{
				var ticker:FrameTicker = tickerMap[id];
				if (ticker)
				{
					ticker.dispose();
					delete tickerMap[id];
				}
			} 
		}
	}
}