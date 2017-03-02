package org.easily.local
{
	import flash.net.SharedObject;
	import flash.utils.ByteArray;

	public class LocalFile
	{
		public var so:SharedObject;
		public var url:String;
		public var error:Boolean = false;
		
		public function LocalFile(url_:String)
		{
			url = url_;
			
			try
			{
				so =SharedObject.getLocal(url, '/');
			} 
			catch(e:Error) 
			{
				print('LocalFile: SharedObject.getLocal url='+url+' error !!!');
				error = true;
				clearBytes();
			}
		}
		
		public function print(msg:String):void
		{
			LocalUtils.print(msg);
		}
		
		public function saveBytes(version:int, bytes:ByteArray):void
		{
			try
			{
				if (version && bytes)
				{
					so.data.bytes = bytes;
					so.flush();
					so.data.version = version;
					so.flush();
					print('LocalFile: saveFile url='+url+' version='+version);
				}
				else
				{
					clearBytes();
				}
			}
			catch(e:Error) 
			{
				print('LocalFile: saveBytes url='+url+' error !!!');
				error = true;
				clearBytes();
			}
		}
		
		public function getBytes(version:int):ByteArray
		{
			try
			{
				if (so.data.version == version)
				{
					return so.data.bytes;
				}
			}
			catch(e:Error) 
			{
				print('LocalFile: getBytes url='+url+' error !!!');
				error = true;
				clearBytes();
			}
			return null;
		}
		
		public function clearBytes():void
		{
			try
			{
				so.clear();
				so.close();
				so = null;
			} 
			catch(e:Error) 
			{
				print('LocalFile: clearBytes url='+url+' error !!!');
				error = true;
			}
		}
		
		public function dispose():void
		{
			try
			{
				so.close();
				so = null;
			}
			catch(e:Error) 
			{
				print('LocalFile: dispose url='+url+' error !!!');
				error = true;
				clearBytes();
			}
			so = null;
			url = null;
		}
	}
}