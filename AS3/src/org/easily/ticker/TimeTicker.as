package org.easily.ticker
{
	import flash.utils.Dictionary;
	
	public class TimeTicker extends Ticker
	{
		public var delay:Number;
		public var repeatCount:int;
		public var tickTime:Number;
		public var tickCount:int;
		
		public function TimeTicker(delay_:Number, repeatCount_:int = 0, timerFunc_:Function = null, compFunc_:Function = null)
		{
			super(timerFunc_, compFunc_);
			
			delay = Math.abs(delay_);
			delay = Math.max(0.001, delay);
			repeatCount = Math.max(0, repeatCount_);
			reset();
		}
		
		override public function reset():void
		{
			tickCount = 0;
			tickTime = 0;
		}
		
		public function setTime(time:int):void
		{
			delay = time;
		}

		override public function doTick(dtime:Number):void
		{
			tickTime += dtime;
			while (tickTime >= delay)
			{
				tickTime -= delay;
				++tickCount;
				if (timerFunc != null)
				{
					timerFunc();
				}
				if (repeatCount > 0 && tickCount >= repeatCount)
				{
					if (compFunc != null)
					{
						compFunc();
					}
					dispose();
					return;
				}
			}
		}
		
		//实用的静态方法
		private static const NAME:String = "timeTicker";
		private static var tickerMap:Dictionary = new Dictionary();
		
		/**
		 * 设置一个指定时间后回调的定时器
		 * 
		 * @param delay:延迟时间
		 * @param callback:回调
		 */
		public static function setTimeout(delay:Number, callback:Function):uint
		{
			var ticker:TimeTicker = new TimeTicker(delay, 1, null, onTimeout);
			ticker.start();
			
			function onTimeout():void
			{
				clearTimeout(id);
				if (callback != null)
				{
					callback();
				}
			}
			
			var id:uint = TickerUtils.genID(NAME);
			tickerMap[id] = ticker;
			ticker.id = id;
			return id;
		}
		
		/**
		 * 移除一个定时器 
		 *
		 * @param id:由setTimeout返回的id
		 */
		public static function clearTimeout(id:uint):void
		{
			if (id > 0)
			{
				var ticker:TimeTicker = tickerMap[id];
				if (ticker)
				{
					ticker.dispose();
					delete tickerMap[id];
				}
			}
		}
		
		/**
		 * 设置一个定时器，间隔delay执行一次 
		 *
		 * @param delay:间隔时间
		 * @param callback:回调
		 * 
		 */
		public static function setInterval(delay:Number, callback:Function):uint
		{
			var ticker:TimeTicker = new TimeTicker(delay, 0, callback);
			ticker.start();
			
			var id:uint = TickerUtils.genID(NAME);
			tickerMap[id] = ticker;
			ticker.id = id;
			return id;
		}
		
		/**
		 * 重置定时器
		 * @param id
		 * 
		 */		
		public static function resetTimer(id:uint):void
		{
			if (id > 0)
			{
				var ticker:TimeTicker = tickerMap[id];
				if (ticker)
				{
					ticker.reset();
				}
			}
		}
		
		/**
		 * 移除一个定时器 
		 *
		 * @param id:由setInterval返回的id
		 */
		public static function clearInterval(id:uint):void
		{
			if (id > 0)
			{
				var ticker:TimeTicker = tickerMap[id];
				if (ticker)
				{
					ticker.dispose();
					delete tickerMap[id];
				}
			}
		}
		
		/**
		 * 设置一个指定次数的定时器
		 * 
		 * @param delay:间隔时间
		 * @param repeatCount:次数
		 * @param callback:回调
		 * @param complete:完成后的回调
		 */
		public static function setTicker(delay:Number, repeatCount:int, callback:Function, compFunc:Function = null):uint
		{
			var ticker:TimeTicker = new TimeTicker(delay, repeatCount, callback, onComplete);
			ticker.start();
			
			function onComplete():void
			{
				if (compFunc != null)
				{
					compFunc();
				}
				clearTicker(id);
			}
			
			var id:uint = TickerUtils.genID(NAME);
			tickerMap[id] = ticker;
			ticker.id = id;
			return id;
		}
		
		/**
		 * 停止计时器
		 * @param id	
		 * 
		 */		
		public static function stopTicker(id:uint):void
		{
			var ticker:TimeTicker = tickerMap[id];
			if(ticker)
			{
				ticker.stop();
			}
		}
		
		/**
		 * 开始计时 
		 * @param id
		 * 
		 */		
		public static function startTicker(id:uint):void
		{
			var ticker:TimeTicker = tickerMap[id];
			if(ticker)
			{
				ticker.start();
			}
		}
		
		public static function resetTickerTime(id:uint, newTime:int):void
		{
			if (id > 0)
			{
				var ticker:TimeTicker = tickerMap[id];
				if (ticker)
				{
					ticker.setTime(newTime);
				}
			}
		}
		
		/**
		 * 移除一个定时器 
		 *
		 * @param id:由setTicker返回的id
		 */
		public static function clearTicker(id:uint):void
		{
			if (id > 0)
			{
				var ticker:TimeTicker = tickerMap[id];
				if (ticker)
				{
					ticker.dispose();
					delete tickerMap[id];
				}
			}
		}
	}
}