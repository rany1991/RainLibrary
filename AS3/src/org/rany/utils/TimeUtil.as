package org.rany.utils
{
	public class TimeUtil
	{
		public function TimeUtil()
		{
		}
		
		/** Converts to a string*/
		public const STRING_FORMATTER : String = "s";
		/** Outputs as a Number, can use the precision specifier: %.2sf will output a float with 2 decimal digits.*/
		public const FLOAT_FORMATER : String = "f";
		/** Outputs as an Integer.*/
		public const INTEGER_FORMATER : String = "d";
		/** Converts to an OCTAL number */
		public const OCTAL_FORMATER : String = "o";
		/** Converts to a Hexa number (includes 0x) */
		public const HEXA_FORMATER : String = "x";
		/** @private */
		public const DATES_FORMATERS : String = "aAbBcDHIjmMpSUwWxXyYZ";
		/** Day of month, from 0 to 30 on <code>Date</code> objects.*/
		public const DATE_DAY_FORMATTER : String = "D";
		/** Full year, e.g. 2007 on <code>Date</code> objects.*/
		public const DATE_FULLYEAR_FORMATTER : String = "Y";
		/** Year, e.g. 07 on <code>Date</code> objects.*/
		public const DATE_YEAR_FORMATTER : String = "y";
		/** Month from 1 to 12 on <code>Date</code> objects.*/
		public const DATE_MONTH_FORMATTER : String = "m";
		/** Hours (0-23) on <code>Date</code> objects.*/
		public const DATE_HOUR24_FORMATTER : String = "H";
		/** Hours 0-12 on <code>Date</code> objects.*/
		public const DATE_HOUR_FORMATTER : String = "I";
		/** a.m or p.m on <code>Date</code> objects.*/
		public const DATE_HOUR_AMPM_FORMATTER : String = "p";
		/** Minutes on <code>Date</code> objects.*/
		public const DATE_MINUTES_FORMATTER : String = "M";
		/** Seconds on <code>Date</code> objects.*/
		public const DATE_SECONDS_FORMATTER : String = "S";
		/** A string rep of a <code>Date</code> object on the current locale.*/
		public const DATE_TOLOCALE_FORMATTER : String = "c";
		
		public static const DATE_YEAR:String = "年";
		public static const DATE_MONTH:String = "月";
		public static const DATE_DAY:String = "日";
		public static const DATE_WEEK:String = "周";
		public static const DATE_HOURS:String = "时";
		public static const DATE_MINUTES:String = "分";
		public static const DATE_SECONDS:String = "秒";
		
		/**
		 * second to "00:00:00"
		 * @param sec:秒
		 * @return 00:0:00
		 */
		public static function getSecToTime(sec:uint):String
		{
			if(!sec)
			{
				return "00:00:00";
			}
			var hour:int = Math.floor(sec / 60 / 60);
			sec %= 60 * 60;
			var minute:int = Math.floor(sec / 60);
			var second:int = sec %  60;
			return fixZero(hour) + ":"  + fixZero(minute) + ":" + fixZero(second);
		}
		
		/**
		 * @pram num,分，秒
		 * @return String(01或者 45)
		 */
		private static function fixZero(num:int):String
		{
			return (num >= 10) ? String(num) : "0" + num;
		} 
		
		/**
		 * 通过传入时间戳，返回具体的时间某年某月某日
		 * @param sec,传入的时间戳
		 * @param flag，是否只显示具体的时间，时分秒
		 * @param double，是否显示完成的时间，年月日时分秒
		 * @return X年X月X日 X时X分X秒
		 * */
		public static function getTimeBySec(sec:uint, flag:Boolean = false, double:Boolean = false):String
		{
			var date:Date = new Date();
			date.time = sec * 1000;
			var strA:String = date.fullYear + DATE_YEAR + (date.month + 1) + DATE_MONTH + date.day + DATE_DAY;
			var strB:String;
			if(flag)
			{
				strB = date.hours + DATE_HOURS + date.minutes + DATE_MINUTES + date.seconds + DATE_SECONDS;
				return strB;
			}
			if(double)
			{
				return strA + strB;
			}
			return strA;
		}
		
		/**
		 * 根据给定的时间戳获取当天午夜0点到给定时间戳时间 经过的秒数
		 * @time 时间戳，单位秒数
		 * @return 经过的秒数
		 * */
		public static function getLastZeroPassTime(time:Number):int
		{
			var date:Date = new Date(time * 1000);
			var zeroDate:Date =  new Date(date.fullYear, date.month, date.date);
			var diff:int = date.getTime() - zeroDate.getTime();
			return diff;
		}
	}
}