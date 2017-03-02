package org.easily.tween
{
	import org.easily.ticker.TimeTicker;

	/**
	 * @author Easily
	 */
	public class LinearTween
	{
		// params.onStart, params.onUpdate, params.onComplete
		public static function to(obj:Object, duration:Number, attrs:Object, params:Object = null):TweenObject
		{
			var tweenObj:TweenObject = new TweenObject;
			tweenObj.init(obj, duration, attrs, params);
			tweenObj.to();
			return tweenObj;
		}
		
		public static function to2(obj:Object, duration:Number, delay:Number, attrs:Object, params:Object = null):void
		{
			TimeTicker.setTimeout(delay, onTimeout);
			function onTimeout():void
			{
				to(obj, duration, attrs, params);
			}
		}
	}
}