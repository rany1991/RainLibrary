package org.easily.loader
{
	import flash.display.Loader;
	import flash.events.AsyncErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;

	//加载字节流
	internal class BytesLoader extends BaseLoader
	{
		public var loader:Loader;
		public var appDomain:ApplicationDomain;
		
		public function BytesLoader(appDomain_:ApplicationDomain = null)
		{
			super();
			
			appDomain = appDomain_;
			appDomain ||= ApplicationDomain.currentDomain;
		}
		
		override public function load(item_:LoaderItem):void
		{
			// TODO Auto Generated method stub
			super.load(item_);
			
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgress);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onError);
			loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
			
			try
			{
				var context:LoaderContext = new LoaderContext(false, appDomain);
				loader.loadBytes(item_.bytes, context);
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
				loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, onProgress);
				loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onError);
				loader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
				loader = null;
			}
			appDomain = null;
			super.dispose();
		}
	}
}