package org.easily.utils
{
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;

	/**
	 * @author Easily
	 */
	public class BitmapDataUtils
	{
		//水平翻转一个位图
		public static function flipHorizontal(bmpData:BitmapData, transparent:Boolean = true, fillColor:uint = 0):BitmapData
		{
			var matrix:Matrix = new Matrix();
			matrix.a = -1;
			matrix.tx = bmpData.width;
			var bmpData_:BitmapData = new BitmapData(bmpData.width, bmpData.height, transparent, fillColor);
			bmpData_.draw(bmpData, matrix);
			return bmpData_;
		}

		//垂直翻转一个位图
		public static function flipVertical(bmpData:BitmapData, transparent:Boolean = true, fillColor:uint = 0):BitmapData
		{
			var matrix:Matrix = new Matrix();
			matrix.d = -1;
			matrix.ty = bmpData.height;
			var bmpData_:BitmapData = new BitmapData(bmpData.width, bmpData.height, transparent, fillColor);
			bmpData_.draw(bmpData, matrix);
			return bmpData_;
		}

		//缩放位图
		public static function scaleBitmapData(bmpData:BitmapData, scaleX:Number, scaleY:Number):BitmapData
		{
			var matrix:Matrix = new Matrix();
			matrix.scale(scaleX, scaleY);
			var bmpData_:BitmapData = new BitmapData(scaleX * bmpData.width, scaleY * bmpData.height, true, 0);
			bmpData_.draw(bmpData, matrix);
			return bmpData_;
		}

		//获取图片真实大小（去除透明部分） 
		public static function getRealImageRect(bitmapData:BitmapData):Rectangle
		{
			return bitmapData.getColorBoundsRect(0xff000000, 0, false);
		}
	}
}
