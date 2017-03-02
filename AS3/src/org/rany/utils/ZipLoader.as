package org.rany.utils
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	
	import org.rany.fzip.FZip;

	/**
	 * @author rany
	 * @time 2016-03-01
	 * */
	public class ZipLoader extends EventDispatcher
	{
		private  var _zip:FZip;
		public function ZipLoader(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function load(url:String):void
		{
			_zip =  new FZip(url);
			_zip.addEventListener(Event.COMPLETE, onComplete);
			_zip.addEventListener(IOErrorEvent.IO_ERROR, onError);
			_zip.addEventListener(ProgressEvent.PROGRESS, onProgress);
			_zip.load(new URLRequest(url));
		}
		
		protected function onComplete(event:Event):void
		{
			dispatchEvent(event);
		}			
		
		protected function onError(event:IOErrorEvent):void
		{
			dispatchEvent(event);
		}
		
		protected function onProgress(event:ProgressEvent):void
		{
			dispatchEvent(event);
		}
		
		public function get zip():FZip
		{
			return _zip;
		}
	}
}