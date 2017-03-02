package org.easily.loader
{
	import org.easily.ds.QueuePriority;

	/**
	 * @author Easily
	 */
	public class ListLoaderEx extends ListLoader
	{
		public function ListLoaderEx(list_:Array, compFunc_:Function=null, progFunc_:Function=null, errorFunc_:Function=null)
		{
			super(list_, compFunc_, progFunc_, errorFunc_);
		}
		
		override public function load():void
		{
			// TODO Auto Generated method stub
			if (list.length > 0)
			{
				var item:LoaderItem = list.shift();
				var clone:LoaderItem = item.clone();
				clone.priority = QueuePriority.HIGH;
				clone.progFunc = onProgress;
				clone.errorFunc = onError(item);
				clone.compFunc = onComplete(item);
				LoaderUtils.loadItem(clone);
				cloneList.push(clone);
			}
			else
			{
				super.allComplete();
			}
		}
		
		override public function checkCount():void
		{
			// TODO Auto Generated method stub
			super.checkCount();
			load();
		}
		
		override public function allComplete():void
		{
			// TODO Auto Generated method stub
		}
	}
}