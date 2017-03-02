package org.easily.ui.tree
{
	import com.greensock.TweenLite;
	
	import org.easily.display.Container;

	/**
	 * @author Easily
	 */
	public class TreeCtrl extends Container 
	{
		public var treeItem:TreeItem;
		public var itemList:Array;
		public var hgap:Number;
		public var speed:Number;
		
		public function TreeCtrl(treeItem_:TreeItem = null, hgap_:Number = 5, speed_:Number = 0.2)
		{
			super();
			
			treeItem = treeItem_;
			hgap = hgap_;
			speed = speed_;
			itemList = [];
			addEventListener(TreeEvent.ITEM_CLICK, onItemClick);
		}

		public function addSubItem(item:TreeItem):TreeItem
		{
			if (numChildren > 0)
			{
				item.y = height + hgap;
			}
			
			addChild(item);
			itemList.push(item);
			
			return item;
		}

		public function addSubItems(array:Array):void
		{
			for each (var item:TreeItem in array)
			{
				addSubItem(item);
			}
		}
		
		public function onItemClick(event:TreeEvent):void
		{
			var index:int = itemList.indexOf(event.getCurrentItem());
			if (index != -1 && index != itemList.length - 1)
			{
				resetPosition(index);
			}
			if (treeItem)
			{
				treeItem.dispatchEvent(new TreeEvent(TreeEvent.CHILD_CLICK, treeItem, event.getTargetItem()));
			}
		}
		
		public function resetPosition(index:int):void
		{
			var item:TreeItem = itemList[index];
			var ypos:Number = item.y + item.height + hgap;
			
			var len:int = itemList.length;
			for (var i:int = index + 1; i < len; ++i)
			{
				item = itemList[i];
				TweenLite.to(item, speed, {y:ypos});
				ypos += item.height + hgap;
			}
		}
		
		override public function get height():Number
		{
			var totleHeight:Number = 0;
			for each (var item:TreeItem in itemList)
			{
				totleHeight += item.height + hgap;
			}
			totleHeight -= hgap;
			
			return totleHeight;
		}
		
		override public function dispose():void
		{
			// TODO Auto Generated method stub
			removeEventListener(TreeEvent.ITEM_CLICK, onItemClick);
			for each (var item:TreeItem in itemList)
			{
				item.dispose();
			}
			treeItem = null;
			itemList = null;
			
			super.dispose();
		}
	}
}
