package org.easily.ui.tree
{
	import flash.events.Event;

	/**
	 * @author Easily
	 */
	public class TreeEvent extends Event 
	{
		public static const ITEM_CLICK:String = "tree_item_click";
		public static const CHILD_CLICK:String = "tree_child_click";
		
		private var mCurrentItem:TreeItem;
		private var mTargetItem:TreeItem;
		
		public function TreeEvent(type:String, currentItem:TreeItem, targetItem:TreeItem)
		{
			super(type, false, false);
			
			mCurrentItem = currentItem;
			mTargetItem = targetItem;
		}
		
		public function getCurrentItem():TreeItem
		{
			return mCurrentItem;
		}
		
		public function getTargetItem():TreeItem
		{
			return mTargetItem;
		}
	}
}
