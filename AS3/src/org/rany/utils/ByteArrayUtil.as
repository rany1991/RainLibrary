package org.rany.utils
{
	import flash.net.registerClassAlias;
	import flash.utils.ByteArray;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	/**
	 * @author rany
	 * */
	public class ByteArrayUtil
	{
		public static const CODE_GB2312:String = "gb2312";
		public static const CODE_UTF8:String = "utf-8";
		public static const CODE_UINICODE:String = "unicode";
		public function ByteArrayUtil()
		{
		}
		
		/**
		 * 克隆Object对象
		 * @param source,需要克隆的对象
		 * @return 返回
		 * */
		public static function cloneObject(source:*):*
		{
			var className:String = getQualifiedClassName(source);
			var packName:String = className.indexOf("::") != -1 ? className.split("::")[1] : className;
			var type:Class = getDefinitionByName(className) as Class;
			registerClassAlias(packName, type);
			var byteArray:ByteArray = new ByteArray();
			byteArray.writeObject(source);
			byteArray.position = 0;
			return byteArray.readObject();
		}
		
		/**
		 * 写入指定长度的字符串
		 * @param ba
		 * @param val
		 * @param len
		 * @param charSet
		 * */
		public static function writeMultiByte(ba:ByteArray, val:String, len:uint, charSet:String = CODE_GB2312):void
		{
			var position:int = ba.position;
			ba.writeMultiByte(val, charSet);
			ba.length = ba.length = position + len;
		}
		
		/**
		 * 获取指定长度的字符串
		 * @param ba
		 * @param val
		 * @param len
		 * @param charSet
		 * @return ba:ByteArray
		 * */
		public static function getMultiByte(val:String, len:uint, charSet:String = CODE_GB2312):ByteArray
		{
			var ba:ByteArray = new ByteArray();
			ba.writeMultiByte(val, charSet);
			ba.length = len;
			return ba;
		}
		
		/**
		 * 读取指定长度的字符串
		 * @param ba
		 * @param len
		 * @param charSet
		 * */
		public static function get readMultiByte(ba:ByteArray, len:uint, charSet:String = CODE_GB2312):String
		{
			return ba.readMultiByte(len, charSet);
		}
		
		/**
		 * 读取64位无符号整数
		 * @param byteArray:ByteArray
		 * @return String
		 * */
		public static function readDoubleInt(byteArray:ByteArray):String
		{
			var intA:uint = byteArray.readUnsignedInt();
			var intB:uint = byteArray.readUnsignedInt();
			var strA:String = intA.toString(16);
			var strB:String = intB.toString(16);
			strA = ("00000000" + strA).substr(strA.length, strA.length + 8);
			strB = ("00000000" + strB).substr(strB.length, strB.length + 8);
			return strA + strB;
		}
		
		/**
		 * 写入64位无符号整数
		 * @param strTarget:String
		 * @param targetByte:ByteArray
		 * */
		public static function writeDoubleInt(strTarget:String, targetByte:ByteArray):void
		{
			var strA:String = strTarget.substr(0, 8);
			var strB:String = strTarget.substr(0, 8);
			var intA:uint = uint("0x" + strA);
			var intB:uint = uint("0x" + strB);
			targetByte.writeUnsignedInt(intA);
			targetByte.writeUnsignedInt(intB);
		}
		
		public static function readString(ba:ByteArray, charSet:String = ""):String
		{
			if(!charSet)
			{
				charSet = CODE_GB2312;
			}
			var len:uint = ba.readUnsignedShort();
			return ba.readMultiByte(len, charSet);
		}
		
	}
}