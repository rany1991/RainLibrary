package org.easily.loader
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;

	//加载二进制数据
	internal class BinaryLoader extends BaseLoader
	{
		public var loader:URLLoader;
		
		public function BinaryLoader()
		{
			super();
		}
		
		override public function load(item_:LoaderItem):void
		{
			// TODO Auto Generated method stub
			super.load(item_);
			
			loader = new URLLoader();
			loader.dataFormat = URLLoaderDataFormat.BINARY;
			loader.addEventListener(Event.OPEN, onOpen);
			loader.addEventListener(Event.COMPLETE, onComplete);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onError);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
			loader.addEventListener(ProgressEvent.PROGRESS, onProgress);
			
			try
			{
				loader.load(new URLRequest(translate(item_.url)));
			}
			catch(error:Error) 
			{
				LoaderUtils.delayCall(onError);
			}
		}
		
		override protected function onComplete(event:Event):void
		{
			// TODO Auto Generated method stub
			super.onComplete(event);
			
			if (item)
			{
				item.onComplete(loader.data);
			}
		}
		
		override public function dispose():void
		{
			// TODO Auto Generated method stub
			if (loader)
			{
				try
				{
					loader.close();
				} 
				catch(error:Error) 
				{
					//print("load close error");
				}
				loader.removeEventListener(Event.OPEN, onOpen);
				loader.removeEventListener(Event.COMPLETE, onComplete);
				loader.removeEventListener(IOErrorEvent.IO_ERROR, onError);
				loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
				loader.removeEventListener(ProgressEvent.PROGRESS, onProgress);
				loader = null;
			}
			super.dispose();
		}
	}
}