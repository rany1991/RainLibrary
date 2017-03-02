package org.easily.utils
{
	/**
	 * @author Easily
	 */
	public class TimeUtil
	{
		//将时间（秒）转换为"##:##"的形式
		public static function format(seconds:int):String
		{
			var minute:int = seconds / 60;
			return StringUtils.substitute("{0}:{1}", NumberUtils.format(minute, "00"), NumberUtils.format(seconds % 60, "00"));
		}
		
		//取得分钟的上界值
		public static function ceil(seconds:int):int
		{
			var minute:int = seconds / 60;
			if (seconds % 60 > 0)
			{
				minute++;
			}
			return minute;
		}
	}
}