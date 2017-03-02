package org.easily.utils
{
	import flash.display.DisplayObject;
	import flash.filters.ColorMatrixFilter;
	
	/**
	 * @author Easily
	 */
	public class ColorMatrixUtil
	{
		public static function setGray(displayObject:DisplayObject):void
		{
			var filter:ColorMatrix = new ColorMatrix();
			filter.adjustBrightness(-100);
			displayObject.filters = [new ColorMatrixFilter(filter)];
		}
	}
}