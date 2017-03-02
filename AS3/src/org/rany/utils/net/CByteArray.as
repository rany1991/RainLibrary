package org.rany.utils.net
{
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	public class CByteArray extends ByteArray
	{
		/**
		 * C ++ 网络编程，传送低字节的
		 * @author rany
		 * @date 2016-03-02
		 * */
		public static var DEFULT_ENDIAN:String = Endian.BIG_ENDIAN;
		private static const HIGH_VALUE:Number =  Number(uint.MAX_VALUE + 1);
		
		public function CByteArray()
		{
			super();
			endian = DEFULT_ENDIAN;
		}
		
		public function writeUTFBytesByLen(value:String, len:int):void
		{
			var pLen:int = this.length;
			if(value)
			{
				writeUTFBytes(value);
			}
			var nLen:int = len - (this.length - pLen);
			for(var i:int = 0; i < nLen; i ++)
			{
				this.writeByte(0);
			}
		}
		
		public function readLong():Number
		{
			var longL:uint = this.readUnsignedInt();
			var longB:uint = this.readUnsignedInt();
			var hPos:Number = HIGH_VALUE;
			var hNum:Number = longB * hPos;
			var longNum:Number = hNum + longL;
			return longNum;
		}
		
		public function writeUTFByInt(value:String):void
		{
			var ba:ByteArray = new ByteArray();
			ba.writeUTFBytes(value);
			writeUnsignedInt(ba.length);
			writeUTFBytes(value);
		}
		
		public function readUTFIntIen():String
		{
			var len:int = readUnsignedInt();
			return readUTFBytes(len);
		}
		
		public function writeLong(value:Number):void
		{
			var hValue:uint = value / HIGH_VALUE;
			var lValue:uint = value - hValue * HIGH_VALUE;
			writeUnsignedInt(lValue);
			writeUnsignedInt(hValue);
		}
		
		public function readInt64Bytes():ByteArray
		{
			return null;
		}
		
		public static function getCByteAry(byte:ByteArray):CByteArray
		{
			var cb:CByteArray = new CByteArray();
			cb.writeBytes(byte);
			cb.position = 0;
			return cb;
		}
	}
}