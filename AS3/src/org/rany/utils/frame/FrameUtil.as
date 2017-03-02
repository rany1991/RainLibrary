package org.rany.utils.frame
{
	import flash.utils.Timer;

	public class FrameUtil
	{
		/**
		 * 帧频计数器
		 * @author rany
		 * @date 2016-03-04
		 * */
		/**flash 帧频*/
		public static const FRAME_RATE:int = 24;
		private var _frameRate:int;
		private var _lastTime:Number;
		private var _isRun:Boolean;
		private var _frameTimer:Timer;
		private var _frameNum:Number;
		
		public function FrameUtil()
		{
			_frameRate = FRAME_RATE;
		}
		
		
		
		public function set frameRate(value:int):void
		{
			_frameRate = value;
		}
		
	}
}