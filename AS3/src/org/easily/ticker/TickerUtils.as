package org.easily.ticker
{
	import org.easily.utils.IDUtils;

	public class TickerUtils
	{
		public static var tickerEgn:TickerEngine = new TickerEngine;
		
		//start doTick
		public static function start():void
		{
			tickerEgn.start();
		}
		
		//stop doTick
		public static function stop():void
		{
			tickerEgn.stop();
		}
		
		//外部驱动
		public static function update():void
		{
			tickerEgn.update();
		}
		
		//添加ticker
		public static function addTicker(ticker:Ticker):void
		{
			tickerEgn.addTicker(ticker);
		}
		
		//移除ticker
		public static function removeTicker(ticker:Ticker):void
		{
			tickerEgn.removeTicker(ticker);
		}
		
		//延迟调用
		public static function delayCall(func:Function, delay:Number = 0.001):void
		{
			TimeTicker.setTimeout(delay, func);
		}
		
		//定时检测
		public static function setChecker(frequency:int, updateFunc:Function, timeout:Number, timeoutFunc:Function):Function
		{
			var t1:int = FrameTicker.setInterval(updateFunc, frequency); 
			var t2:int = TimeTicker.setTimeout(timeout, onTimeout);
			function clearTimer():void
			{
				FrameTicker.clearInterval(t1);
				TimeTicker.clearTimeout(t2);
			}
			function onTimeout():void
			{
				FrameTicker.clearInterval(t1);
				clearTimer();
				timeoutFunc();
			}
			return clearTimer;
		}
		
		//ticker id
		public static function genID(key:String):uint
		{
			return IDUtils.genID(key);
		}
	}
}