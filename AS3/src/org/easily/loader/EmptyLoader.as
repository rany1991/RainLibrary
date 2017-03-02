package org.easily.loader
{
	

	public class EmptyLoader extends BaseLoader
	{
		public function EmptyLoader()
		{
			super();
		}
		
		override public function load(item_:LoaderItem):void
		{
			// TODO Auto Generated method stub
			super.load(item_);
			
			LoaderUtils.delayCall(onError);
		}
	}
}