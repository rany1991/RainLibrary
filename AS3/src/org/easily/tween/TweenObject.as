package org.easily.tween
{
	import org.easily.ticker.FrameTicker;

	/**
	 * @author Easily
	 */
	public class TweenObject
	{
		public var obj:Object;
		public var duration:Number;
		public var attrs:Object;
		public var params:Object;
		public var start:Object;
		public var change:Object;
		public var keys:Array;
		public var count:Number;
		public var timer:int;
		
		public function TweenObject()
		{
			timer = 0;
			count = 0;
			start = {};
			change = {};
			keys = [];
		}
		
		public function init(obj_:Object, duration_:Number, attrs_:Object, params_:Object):void
		{
			obj = obj_;
			duration = duration_;
			attrs = attrs_;
			params = params_;
			if (obj)
			{
				for (var key:Object in attrs)
				{
					keys.push(key);
					start[key] = obj[key];
					change[key] = attrs[key] - obj[key];
				}
			}
		}
		
		public function to():void
		{
			if (obj)
			{
				timer = FrameTicker.setInterval(update);
				onStart();
				onUpdate();
			}
			else
			{
				onComplete();
				dispose();
			}
		}
		
		public function update(dtime:Number):void
		{
			count += dtime;
			if (count < duration)
			{
				var per:Number = count / duration;
				apply(per);
				onUpdate();
			}
			else
			{
				apply2();
				onUpdate();
				onComplete();
				dispose();
			}
		}
		
		public function apply(per:Number):void
		{
			for each(var key:Object in keys)
			{
				obj[key] = start[key] + change[key] * per;
			}
		}
		
		public function apply2():void
		{
			for each(var key:Object in keys)
			{
				obj[key] = attrs[key];
			}
		}
		
		public function onStart():void
		{
			if (params && params.onStart)
			{
				params.onStart();
			}
		}
		
		public function onUpdate():void
		{
			if (params && params.onUpdate)
			{
				params.onUpdate();
			}
		}
		
		public function onComplete():void
		{
			if (params && params.onComplete)
			{
				params.onComplete();
			}
		}
		
		public function dispose():void
		{
			FrameTicker.clearInterval(timer);
			obj = null;
			attrs = null;
			params = null;
			start = null;
			change = null;
			keys = null;
		}
	}
}