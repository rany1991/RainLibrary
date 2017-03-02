package org.easily.loader
{
	import flash.events.Event;
	import flash.events.ProgressEvent;

	//基础加载类
	internal class BaseLoader
	{
		public var item:LoaderItem;
		public var state:int;

		public function BaseLoader()
		{
			state = LoaderState.INIT;
		}

		//资源链接转换
		public function translate(url:String):String
		{
			if (!item.transform)
			{
				return url;
			}
			return LoaderUtils.translate(url);
		}
		
		//打印
		public function print(msg:String):void
		{
			LoaderUtils.print(msg);
		}

		//开始加载
		public function load(item_:LoaderItem):void
		{
			item = item_;
		}

		//加载error
		protected function onError(event:Event = null):void
		{
			// TODO Auto-generated method stub
			state = LoaderState.ERROR;
			if (item)
			{
				item.onError();
			}
		}

		//响应http请求
		protected function onOpen(event:Event):void
		{
			// TODO Auto-generated method stub
			state = LoaderState.OPEN;
			if (item)
			{
				item.onOpen();
			}
		}

		//加载进度
		protected function onProgress(event:ProgressEvent):void
		{
			// TODO Auto-generated method stub
			if (item && item.progFunc != null)
			{
				item.progFunc(event.bytesLoaded, event.bytesTotal);
			}
		}

		//加载完成
		protected function onComplete(event:Event):void
		{
			// TODO Auto-generated method stub
			state = LoaderState.COMPLETE;
		}

		//销毁
		public function dispose():void
		{
			state = LoaderState.DISPOSE;
			if (item)
			{
				item.dispose();
				item = null;
			}
		}
	}
}
