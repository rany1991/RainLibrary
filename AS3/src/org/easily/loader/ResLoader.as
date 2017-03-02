package org.easily.loader
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequest;

	//加载普通资源
	internal class ResLoader extends BaseLoader
	{
		public var loader:Loader;
		
		public function ResLoader()
		{
			super();
		}
		
		override public function load(item_:LoaderItem):void
		{
			// TODO Auto Generated method stub
			super.load(item_);
			
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			loader.contentLoaderInfo.addEventListener(Event.OPEN, onOpen);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onError);
			loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgress);
			
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
				item.onComplete(loader.content);
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
				loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onComplete);
				loader.contentLoaderInfo.removeEventListener(Event.OPEN, onOpen);
				loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onError);
				loader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
				loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, onProgress);
				loader = null;
			}
			super.dispose();
		}
	}
}