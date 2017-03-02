package org.easily.ui 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class Loading extends Sprite
	{
		private var nums:int = 12;
		private var m2:Matrix = new Matrix();
		private var m:Matrix =  new Matrix();
		private var Abar:Array = new Array();
		private var segAngle:Number;
		private var seg:Number;
		private var j:Number = 0;
		private var timer:Timer =  new Timer(50);
		public function Loading()
		{
			initBar();
		}
		
		private function initBar():void
		{
			segAngle = 2 * Math.PI / this.nums;
			seg = 1 / this.nums;
			for (var i:int = 0; i < this.nums; i++)
			{
				var bar:Shape=new Shape();
				Abar[i] = bar;
				bar.graphics.beginFill(0xffffff);
				bar.graphics.drawRoundRect(0,0,10,3,4,4);
				bar.graphics.endFill();
				this.addChild(bar);
				bar.alpha = seg * i;
				bar.x = bar.y = 100;
				m.identity();
				m.translate(7,-1);
				m.rotate(segAngle*i);
				m.translate(-7,1);
				m2.identity();
				m2.translate(100,100);
				m.concat(m2);
				bar.transform.matrix = m;
			}
			timer.addEventListener(TimerEvent.TIMER,alphaHalder);
			timer.start();
		}
		
		private function alphaHalder(evt:TimerEvent):void
		{
			for (var i:int = 0; i < this.nums; i++)
			{
				var bar:Shape = Abar[i] as Shape;
				bar.alpha = j;
				if(j == 1.0833333333333333)
				{
					j = 0;
				}
				j += seg;
			}
		}
	}
}