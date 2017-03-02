package org.easily.ticker
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getTimer;
	
	/**
	 * @author Easily
	 */
	public class TickerEngine extends Sprite
	{
		public var tickerMgr:TickerManager = new TickerManager;
		public var lastTime:Number = getTimer();
		
		public function TickerEngine()
		{
			super();
		}
		
		public function start():void
		{
			stop();
			lastTime = getTimer();
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function stop():void
		{
			removeEventListener(Event.ENTER_FRAME, update);
		}
		
		public function update(event:Event = null):void
		{
			var time:Number = getTimer();
			var dtime:Number = time - lastTime;
			lastTime = time;
			if (tickerMgr)
			{
				tickerMgr.doTick(dtime);
			}
		}
		
		public function addTicker(ticker:Ticker):void
		{
			if (tickerMgr)
			{
				tickerMgr.addTicker(ticker);
			}
		}
		
		public function removeTicker(ticker:Ticker):void
		{
			if (tickerMgr)
			{
				tickerMgr.removeTicker(ticker);
			}
		}
		
		public function dispose():void
		{
			// TODO Auto Generated method stub
			stop();
			if (tickerMgr)
			{
				tickerMgr.dispose();
				tickerMgr = null;
			}
		}
	}
}