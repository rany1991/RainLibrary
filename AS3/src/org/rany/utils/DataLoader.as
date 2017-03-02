package org.rany.utils
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	/**
	 *加载data数据
	 * @author rany
	 * @date 2016-03-03-01
	 **/
	public class DataLoader
	{
		private var _urlLoader:URLLoader;
		private var _content:Object;
		private var _backFun:Function;
		private var _dataSrc:Object;
		
		public function DataLoader()
		{
			_urlLoader = new URLLoader();
			_urlLoader.addEventListener(Event.COMPLETE, onComplete);
			_urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onError);
		}
		/**
		 * 加载数据
		 * @param url
		 * @param backFun
		 * */
		public function load(url:String, backFun:Function = null, dataSrc:Object = null, type:String = null):void
		{
			if(!type)
			{
				_urlLoader.dataFormat = type;
			}
			_dataSrc = dataSrc;
			_urlLoader.load(new URLRequest(url));
			_backFun = backFun;
		}
		
		protected function onComplete(event:Event):void
		{
			clearListener();
			if(_backFun != null)
			{
				_backFun();
			}
			_content = _urlLoader.data;
			if(_dataSrc != null)
			{
				if(_dataSrc is Function)
				{
					_dataSrc(_content);
				}
				else
				{
					_dataSrc = _content;
				}
			}
			_content = null;
		}
		
		protected function onError(event:IOErrorEvent):void
		{
			clearListener();
		}
		
		private function clearListener():void
		{
			_urlLoader.removeEventListener(Event.COMPLETE, onComplete);
			_urlLoader.removeEventListener(IOErrorEvent.IO_ERROR, onError);
		}
		
		public function clear():void
		{
			clearListener();
			_backFun = null;
			_urlLoader = null;
			_dataSrc = null;
		}
		
		public function get content():Object
		{
			return _content;
		}
	}
}