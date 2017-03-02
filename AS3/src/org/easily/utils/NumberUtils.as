package org.easily.utils
{
	/**
	 * @author Easily
	 */
	public class NumberUtils
	{
		/*
		* 格式化一个数字
		* 例如：number=12,mask="000",返回为"012"
		*/
		public static function format(number:Number, mask:String):String
		{
			var str:String = String(number);
			var dif:int = mask.length - str.length;
			if (dif <= 0)
			{
				return str;
			}
			str = mask.substr(0, dif) + str;
			return str;
		}
		
		//将一个十六进制数据转换成html格式
		public static function hexToCSS(num:uint):String
		{
			return "#" + num.toString(16);
		}
	}
}