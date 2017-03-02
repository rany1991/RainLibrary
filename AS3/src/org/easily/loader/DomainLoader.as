package org.easily.loader
{
	import flash.system.ApplicationDomain;
	import flash.utils.ByteArray;

	//加载到应用程序域
	internal class DomainLoader extends BaseLoader
	{
		private var binLoader:BinaryLoader;
		private var bytesLoader:BytesLoader;
		
		public function DomainLoader()
		{
			super();
		}
		
		override public function load(item_:LoaderItem):void
		{
			// TODO Auto Generated method stub
			super.load(item_);
			
			var compFunc_:Object = item_.compFunc;
			item_.compFunc = binLoaded;
			binLoader = new BinaryLoader();
			binLoader.load(item_);
			
			function binLoaded(bytes:ByteArray):void
			{
				item_.compFunc = bytesLoaded;
				item_.progFunc = null;
				item_.bytes = bytes;
				
				bytesLoader = new BytesLoader();
				bytesLoader.load(item_);
				
				function bytesLoaded(content:*):void
				{
					LoaderUtils.removeChildren(content);
					if (compFunc_)
					{
						compFunc_(content);
					}
				}
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