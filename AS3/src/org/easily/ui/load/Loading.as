package org.easily.ui.load 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.geom.Matrix;
	import flash.utils.Timer;
	
	public class Loading extends Sprite
	{
		private var nums:int = 12;
		private var count:int = 0;
		private var m:Matrix =  new Matrix();
		private var m2:Matrix = new Matrix();
		private var bars:Array = [];
		private var angle:Number;
		private var seg:Number;
		private var j:Number = 0;
		private var timer:Timer;
		
		public function Loading()
		{
			angle = 2 * Math.PI / nums;
			seg = 1 / nums;
			for (var i:int = 0; i < nums; i++)
			{
				var bar:Shape = new Shape();
				bars[i] = bar;
				bar.graphics.beginFill(0xffffff);
				bar.graphics.drawRoundRect(0, 0, 10, 3, 4, 4);
				bar.graphics.endFill();
				addChild(bar);
				bar.alpha = seg * i;
				bar.x = bar.y = 100;
				m.identity();
				m.translate(7, -1);
				m.rotate(angle * i);
				m.translate(-7, 1);
				m2.identity();
				m2.translate(100, 100);
				m.concat(m2);
				bar.transform.matrix = m;
			}
			
			timer = new Timer(100);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
		}
		
		private function onTimer(e:TimerEvent):void
		{
			for (var i:int = 0; i < nums; i++)
			{
				var bar:Shape = bars[i];
				bar.alpha = j;
				if (count > nums) 
				{
					j = 0;
					count = 0;
				}
				count++;
				j += seg;
			}
		}
		
		public function dispose():void
		{
			timer.stop();
			timer.removeEventListener(TimerEvent.TIMER, onTimer);
		}
	}
}