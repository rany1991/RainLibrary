package org.rany.utils
{
	import flash.display.DisplayObjectContainer;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.ColorTransform;
	
	import org.easily.utils.ColorMatrix;

	/**
	 * 获取某些特殊滤镜的工具类
	 * @rany
	 * */
	public class FilterUtil
	{
		public function FilterUtil()
		{
		}
		
		/**
		 * 一种比较常见的浅白色颜色滤镜
		 * */
		public static function getWhiteFilter():ColorMatrixFilter
		{
			return getColorAjdustFilter(20, 10, 5);
		}
		
		/**
		 * 新的Gray滤镜，浅灰色
		 * */
		public static function getGrayFilter():ColorMatrixFilter
		{
			return getColorAjdustFilter(-40, 0, -80);
		}
		
		public static function getGrayFilter2():ColorMatrixFilter
		{
			return getColorAjdustFilter(-80, 0 , -100);
		}
		
		
		/**
		 * 程序实现Flash颜色调整了滤镜，需要依次传入亮度、对比度、饱和度、色相
		 * @param brightness，亮度
		 * @param contrast，对比度
		 * @param saturation，饱和度
		 * @param hue，色相
		 * @return ColorMatrixFilter 配了相应值的颜色滤镜
		 * */
		public static function getColorAjdustFilter(brightness:Number = 0, contrast:Number = 0,
													saturation:Number = 0, hue:Number = 0):ColorMatrixFilter
		{
			var matrix:ColorMatrix = new ColorMatrix();
			matrix.adjustColor(brightness, contrast, saturation, hue);
			var colorFilter:ColorMatrixFilter = new ColorMatrixFilter();
			colorFilter.matrix = matrix;
			return colorFilter;
		}
		
		/**
		 * 10进制设置对象的颜色
		 * */
		public static function setColorTransformToObj(obj:DisplayObjectContainer, alphaMultiplier:Number, 
													  redMultiplier:Number, greeMuliplier:Number, buleMultiplier:Number):void
		{
			var color:ColorTransform = obj.transform.colorTransform;
			color.alphaMultiplier = alphaMultiplier;
			color.redMultiplier = redMultiplier;
			color.greenMultiplier = greeMuliplier;
			color.blueMultiplier = buleMultiplier;
		}
				
		
		
	}
}