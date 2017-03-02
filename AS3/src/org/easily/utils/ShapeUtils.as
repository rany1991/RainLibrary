package org.easily.utils
{
	import flash.display.DisplayObject;
	import flash.display.Shape;

	/**
	 * @author Easily
	 */
	public class ShapeUtils
	{
		public static function drawRect(color:uint, alpha:Number, x:Number, y:Number, width:Number, height:Number):Shape
		{
			var sp:Shape = new Shape;
			sp.graphics.beginFill(color, alpha);
			sp.graphics.drawRect(x, y, width, height);
			sp.graphics.endFill();
			return sp;
		}
		
		public static function drawCircle(color:uint, alpha:Number, x:Number, y:Number, radius:Number):Shape
		{
			var sp:Shape = new Shape;
			sp.graphics.beginFill(color, alpha);
			sp.graphics.drawCircle(x, y, radius);
			sp.graphics.endFill();
			return sp;
		}
	}
}