package org.easily.tween
{
	import flash.display.MovieClip;

	/**
	 * @author Easily
	 */
	public class FrameTween
	{
		public static function play(mc:MovieClip, duration:Number, compFunc:Object, onUpdate_:Object = null):void
		{
			play2(mc, duration, 1, mc.totalFrames, compFunc, onUpdate_);
		}
		
		public static function play2(mc:MovieClip, duration:Number, start:int, end:int, compFunc_:Object, onUpdate_:Object = null):void
		{
			var temp:Object = {frame:start};
			if (mc)
			{
				mc.gotoAndStop(start);
			}
			var param:Object = {onComplete:compFunc_};
			param.onUpdate = (start < end ? onUpdate1 : onUpdate2);
			LinearTween.to(temp, duration, {frame:end}, param);
			function onUpdate1():void
			{
				var frame:int = temp.frame;
				var index:int = mc.currentFrame;
				while (index < frame)
				{
					mc.gotoAndStop(++index);
					if (onUpdate_)
					{
						onUpdate_();
					}
				}
			}
			function onUpdate2():void
			{
				var frame:int = temp.frame;
				var index:int = mc.currentFrame;
				while (index > frame)
				{
					mc.gotoAndStop(--index);
					if (onUpdate_)
					{
						onUpdate_();
					}
				}
			}
		}
	}
}