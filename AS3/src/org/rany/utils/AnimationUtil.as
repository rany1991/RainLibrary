package org.rany.utils
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class AnimationUtil extends Bitmap
	{
		public var imgList:Array = new Array();
		private var timer:Timer = new Timer(100);
		private var _currentFrame:int;
		private var _stopIndex:int = 0;
		
		public function AnimationUtil(bitmapData:BitmapData = null, pixelSnapping:String = "auto", smoothing:Boolean = false)
		{
			super(bitmapData, pixelSnapping, smoothing);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
		}
		
		public function play():void
		{
			timer.reset();
			timer.start();
		}
		
		public function stop():void
		{
			timer.stop();
		}
		
		public function set frameRate( value:int ):void
		{
			timer.delay = value;
		}
		
		public function set repeatCount( value:int ):void
		{
			timer.repeatCount = value * imgList.length;
		}
		
		public function set stopIndex( value:int ):void
		{
			_stopIndex = value;
			_currentFrame = _stopIndex;
			this.bitmapData = imgList[_stopIndex];
		}
		
		private function onTimer(event:TimerEvent):void
		{
			this.bitmapData = imgList[_currentFrame];
			_currentFrame ++;
			if(_currentFrame > imgList.length - 1)
			{
				_currentFrame = _stopIndex;
				this.bitmapData = imgList[_stopIndex];
			}
		}
		
	}
}