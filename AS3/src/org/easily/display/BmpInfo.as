package org.easily.display
{
	import flash.geom.Rectangle;

	public class BmpInfo
	{
		public var x:Number;
		public var y:Number;
		public var w:Number;
		public var h:Number;
		public var rect:Rectangle;
		
		public function BmpInfo(x_:Number, y_:Number, w_:Number, h_:Number)
		{
			x = x_;
			y = y_;
			w = w_;
			h = h_;
			genRect();
		}
		
		public function genRect():void
		{
			rect = new Rectangle(x, y, w, h);
		}
		
		public function dispose():void
		{
			rect = null;
		}
	}
}