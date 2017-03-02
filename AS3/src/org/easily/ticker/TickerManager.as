package org.easily.ticker
{
	public class TickerManager
	{
		public var tickers:Array = [];
		public var clones:Array = [];
		
		public function TickerManager()
		{
		}
		
		public function doTick(dtime:Number):void
		{
			var len:int = tickers.length;
			clones.length = len;
			for (var i:int = 0; i < len; ++i)
			{
				clones[i] = tickers[i];
			}
			for each (var ticker:Ticker in clones)
			{
				ticker.doTick(dtime);
			}
		}
		
		public function addTicker(ticker:Ticker):void
		{
			tickers.push(ticker);
		}
		
		public function removeTicker(ticker:Ticker):void
		{
			var index:int = tickers.indexOf(ticker);
			if (index != -1)
			{
				tickers.splice(index, 1);
			}
		}
		
		public function dispose():void
		{
			for each (var ticker:Ticker in tickers.concat(clones))
			{
				ticker.dispose();
			}
			tickers.length = clones.length = 0;
		}
	}
}