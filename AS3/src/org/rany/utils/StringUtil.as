package org.rany.utils
{
	public class StringUtil
	{
		/**
		 * 
		 * @author rany
		 * @date 2016-03-06
		 * */
		public function StringUtil()
		{
		}
		/**
		 * @param character,传入的字符串
		 * @return ture or false
		 * */
		public static function isWhitespace(character:String):Boolean
		{
			switch(character)
			{
				case " ":
				case "\t":
				case "\r":
				case "\n":
				case "\f":
					return true;
				default:
					return false
			}
		}
		
		/**
		 * @param str,输入的字符串
		 * @return 返回此字符串的一个副本，其中所有大写的字符均转换为小写字符。原始字符串保持不变。
		 */
		public function getLowerCase(str:String):String
		{
			return str.toLowerCase();
		}
		
		/**
		 * @param str,输入的字符串
		 * @return 返回此字符串的一个副本，其中所有小写的字符均转换为大写字符。原始字符串保持不变。
		 */
		public function getUpperCase(str:String):String
		{
			return str.toUpperCase();
		}
		
		
	}
}