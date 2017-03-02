package org.easily.com.treectrl
{
	import flash.events.MouseEvent;
	
	import org.easily.display.Container;

	/**
	 * @author Easily
	 */
	public class TreeItem extends Container 
	{
		public var data:Object;
		public var treeCtrl:TreeCtrl;
		public var body:Container;
		public var subTree:TreeCtrl;
		public var hgap:Number;
		
		public function TreeItem(treeCtrl_:TreeCtrl, hgap_:Number = 5)
		{
			super();
			
			hgap = hgap_;
			treeCtrl = treeCtrl_;
			subTree = new TreeCtrl(this, hgap);
			
			addEventListener(MouseEvent.CLICK, onItemClick);
			addEventListener(TreeEvent.CHILD_CLICK, onChildClick);
		}

		public function addSubItem(item:TreeItem):TreeItem
		{
			return subTree.addSubItem(item);
		}
		
		public function addSubItems(array:Array):void
		{
			if (subTree)
			{
				subTree.addSubItems(array);
			}
		}
		
		public function onItemClick(event:MouseEvent):void
		{
			event.stopPropagation();
			
			if (contains(subTree))
			{
				removeChild(subTree);
			}
			else if (subTree.itemList.length)
			{
				addChild(subTree);
			}
			if (treeCtrl)
			{
				treeCtrl.dispatchEvent(new TreeEvent(TreeEvent.ITEM_CLICK, this, this));
			}
		}
		
		public function onChildClick(event:TreeEvent):void
		{
			if (treeCtrl)
			{
				treeCtrl.dispatchEvent(new TreeEvent(TreeEvent.ITEM_CLICK, this, event.getTargetItem()));
			}
		}
		
		override public function get height():Number
		{
			if (contains(subTree))
			{
				return subTree.height + hgap + body.height;
			}
			
			return body.height;
		}
		
		override public function dispose():void
		{
			// TODO Auto Generated method stub
			removeEventListener(MouseEvent.CLICK, onItemClick);
			removeEventListener(TreeEvent.CHILD_CLICK, onChildClick);
			if (subTree)
			{
				subTree.dispose();
				subTree = null;
			}
			if (body)
			{
				body.dispose();
				body = null;
			}
			treeCtrl = null;
			
			super.dispose();
		}
	}
}
