package org.easily.loader
{
	import flash.system.ApplicationDomain;
	import flash.utils.ByteArray;
	
	public class AppLoader extends BaseLoader
	{
		private var binLoader:BinaryLoader;
		private var bytesLoader:BytesLoader;
		
		public function AppLoader()
		{
			super();
		}
		
		override public function load(item_:LoaderItem):void
		{
			// TODO Auto Generated method stub
			super.load(item_);
			
			var compFunc_:Function = item_.compFunc;
			item_.compFunc = binLoaded;
			binLoader = new BinaryLoader();
			binLoader.load(item_);
			
			function binLoaded(bytes:ByteArray):void
			{
				item_.compFunc = compFunc_;
				item_.progFunc = null;
				item_.bytes = bytes;
				
				bytesLoader = new BytesLoader(new ApplicationDomain);
				bytesLoader.load(item_);
			}
		}
		
		override public function dispose():void
		{
			// TODO Auto Generated method stub
			if (binLoader)
			{
				binLoader.dispose();
				binLoader = null;
			}
			if (bytesLoader)
			{
				bytesLoader.dispose();
				bytesLoader = null;
			}
			super.dispose();
		}
	}
}