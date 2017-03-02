package org.easily.test.shape
{
	import flash.display.Sprite;
	
	public class Arrow extends Sprite
	{
		public function Arrow()
		{
			super();
			init();
		}
		
		public function init():void
		{
			graphics.lineStyle(1, 0, 1);
			graphics.beginFill(0xffff00);
			graphics.moveTo(-50, -25);
			graphics.lineTo(0, -25);
			graphics.lineTo(0, -50);
			graphics.lineTo(50, 0);
			graphics.lineTo(0, 50);
			graphics.lineTo(0, 25);
			graphics.lineTo(-50, 25);
			graphics.lineTo(-50, -25);
			graphics.endFill();
		}
	}
}