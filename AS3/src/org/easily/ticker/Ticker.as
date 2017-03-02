package org.easily.ticker
{
	public class Ticker
	{
		public var id:uint;
		public var timerFunc:Function;
		public var compFunc:Function;
		
		public function Ticker(timerFunc_:Function = null, compFunc_:Function = null)
		{
			timerFunc = timerFunc_;
			compFunc = compFunc_;	
		}
		
		public function start():void
		{
			stop();
			TickerUtils.addTicker(this);
		}
		
		public function stop():void
		{
			TickerUtils.removeTicker(this);
		}
		
		public function reset():void
		{
		}
		
		public function doTick(dtime:Number):void
		{
		}
		
		public function dispose():void
		{
			stop();
			reset();
			timerFunc = null;
			compFunc = null;
		}
	}
}