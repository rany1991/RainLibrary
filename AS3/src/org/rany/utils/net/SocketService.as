package org.rany.utils.net
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;
	import flash.utils.Endian;

	/**
	 * 
	 * @author rany
	 * @date 2016-03-09
	 * 
	 * */
	public class SocketService extends EventDispatcher
	{
		public static const COMPRESS_BIT:uint = 1073741824;
		protected var socket:Socket;
		protected var sendCount:int;
		private var responderList:Array;
		private var _name:String;
		public var useComPress:Boolean;
		
		public function SocketService(name:String = "")
		{
			_name = name;
			responderList = [];
		}
		
		public function connect(ip:String, port:int):void
		{
			socket = new Socket();
			socket.endian = Endian.BIG_ENDIAN;
			regEvents();
			socket.connect(ip, port);
			sendCount = 0;
		}
		
		private function regEvents():void
		{
			socket.addEventListener(Event.COMPLETE, scConnHandler);
			socket.addEventListener(IOErrorEvent.IO_ERROR, scIOErrorHandler);
			socket.addEventListener(Event.CLOSE, scCloseHandler);
			socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, scSecErrorHandler);
			socket.addEventListener(ProgressEvent.SOCKET_DATA, scLoopHandler);
		}
		
		protected function scConnHandler(event:Event):void
		{
			dispatchEvent(event);
		}
		
		protected function scIOErrorHandler(event:IOErrorEvent):void
		{
			dispatchEvent(event);
		}
		
		protected function scCloseHandler(event:Event):void
		{
			dispatchEvent(event);
		}
		
		protected function scSecErrorHandler(event:SecurityErrorEvent):void
		{
			dispatchEvent(event);
		}
		
		protected function scLoopHandler(event:ProgressEvent):void
		{
			if(socket && socket.connected && socket.bytesAvailable > 0)//输入缓冲区中可读取的数据的字节数
			{
				read();
			}
		}
		
		public function read():void
		{
			
		}
		
		public function send(bytes:ByteArray):void
		{
			if(!socket || !socket.connected)
			{
				return;
			}
			var body:CByteArray = new CByteArray();
			if(bytes.length > 32 && useComPress)
			{
				bytes.compress();
				bytes.writeUnsignedInt(bytes.length + COMPRESS_BIT);
			}
			else
			{
				body.writeUnsignedInt(bytes.bytesAvailable);
			}
			bytes.position = 0;
			body.writeBytes(bytes);
			socket.writeBytes(body);
			socket.flush();
			sendCount ++;
			bytes.clear();
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get isConnected():Boolean
		{
			if(!socket)
			{
				return false;
			}
			return socket.connected;
		}
	}
}