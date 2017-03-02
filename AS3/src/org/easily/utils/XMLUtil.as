package org.easily.utils
{
	/**
	 * @author Easily
	 */
	public class XMLUtil
	{
		public static function CDATA(data:String):XML
		{
			return new XML("<![CDATA[" + data + "]]\>");
		}
	}
}