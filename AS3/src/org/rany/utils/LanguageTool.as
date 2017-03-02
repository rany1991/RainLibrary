package org.rany.utils
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;

	public class LanguageTool
	{
		private static var _instance:LanguageTool;
		private var _langDic:Dictionary;
		public function LanguageTool()
		{
			
		}
		
		private var urlLoader:URLLoader;
		public function parseFile(url:String):void
		{
			urlLoader = new URLLoader(new URLRequest(url));
			urlLoader.addEventListener(Event.COMPLETE, onComplete);
		}
		
		protected function onComplete(event:Event):void
		{
			var loader:URLLoader = event.currentTarget as URLLoader;
			loader.data;
		}		
		
		
		
		public function get langDic():Dictionary
		{
			return _langDic;
		}
		
		public static function get instance():LanguageTool
		{
			if(!_instance)
			{
				_instance = new LanguageTool();
			}
			return _instance;
		}
	}
}