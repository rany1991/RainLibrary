package org.easily.local
{
	import flash.events.NetStatusEvent;
	import flash.net.SharedObject;
	import flash.net.SharedObjectFlushStatus;
	import flash.utils.ByteArray;
	import org.easily.utils.FunctionUtils;

	public class LocalUtils
	{
		/*
		Algorithm:MD5
		PlainText:yesguo
		Hash:MD5: 96b8afbb6a8826c67caeb2ace02ca6f8 
		MD5-16: 6a8826c67caeb2ac
		*/
		
		public static var NAME:String = "6a8826c67caeb2ac";
		public static var KEY:int = 123;
		
		//是否开启本地存储
		public static var localSave:Boolean = false;
		
		//sharedObject for test
		public static var soTest:SharedObject;
		
		//打印
		public static var print:Function = function(msg:String):void
		{
			trace(msg);
		}
		
		//初始化
		public static function init():void
		{
			try
			{
				soTest = SharedObject.getLocal('sharedObj_for_test', '/');
				getKey();
			}
			catch(error:Error)
			{
				LocalUtils.print('Test get SharedObject error !!!');
			}
		}
		
		public static function getKey():void
		{
			try
			{
				var key:int = soTest.data.key;
				localSave = (key == KEY);
				LocalUtils.print('LocalUtils.key='+key);
			} 
			catch(error:Error) 
			{
				LocalUtils.print('SharedObject get key error !!!');
			}
		}
		
		public static function saveKey():void
		{
			try
			{
				soTest.data.key = KEY;
				soTest.flush();
			}
			catch(error:Error) 
			{
				LocalUtils.print('SharedObject save key error !!!');
			}
		}
		
		//clone bytes
		public static function cloneBytes(bytes:ByteArray):ByteArray
		{
			if (!bytes)
			{
				return null;
			}
			
			var position:uint = bytes.position;
			bytes.position = 0;
			var bytes_:ByteArray = new ByteArray;
			bytes.readBytes(bytes_);
			bytes.position = position;
			return bytes_;
		}
		
		//获取文件
		public static function getFile(url:String, version:int):ByteArray
		{
			if (!localSave)
			{
				return null;
			}
			
			var file:LocalFile = new LocalFile(url);
			var bytes:ByteArray = cloneBytes(file.getBytes(version));
			if (file.error)
			{
				return null;
			}
			
			file.dispose();
			return bytes;
		}
		
		//保存文件
		public static function saveFile(url:String, version:int, bytes:ByteArray):void
		{
			if (localSave && url && bytes)
			{
				var file:LocalFile = new LocalFile(url);
				file.saveBytes(version, cloneBytes(bytes));
				file.dispose();
			}
		}
		
		//删除文件
		public static function removeFile(url:String):void
		{
			if (url)
			{
				var file:LocalFile = new LocalFile(url);
				file.clearBytes();
				file.dispose();
			}
		}
		
		//结果
		public static const Flushed:String = 'SharedObject.Flush.Flushed';
		public static const Success:String = 'SharedObject.Flush.Success';
		public static const Failed:String = 'SharedObject.Flush.Failed';
		
		//提示用户进行存储设置
		public static function showTip(compFunc:Function=null):void 
		{
			try
			{
				if (soTest.flush(10000000000) == SharedObjectFlushStatus.FLUSHED)
				{
					LocalUtils.print('SharedObjectFlushStatus.FLUSHED !!!');
					FunctionUtils.call(compFunc);
					localSave = true;
					saveTag();
				}
				else
				{
					soTest.addEventListener(NetStatusEvent.NET_STATUS, onNetStatus);
				}
				function onNetStatus(event:NetStatusEvent):void
				{
					FunctionUtils.call(compFunc);
					var code:String = event.info.code;
					LocalUtils.print('SharedObject netStatus='+code);
					localSave = (code == Success);
					saveTag();
					soTest.removeEventListener(NetStatusEvent.NET_STATUS, onNetStatus);
				}
			} 
			catch(error:Error) 
			{
				FunctionUtils.call(compFunc);
				localSave = false;
				saveTag();
			}
			function saveTag():void
			{
				if (localSave)
				{
					saveKey();
				}
			}
		}
	}
}