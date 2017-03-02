package org.easily.com.group
{
	/**
	 * @author Easily
	 */
	public class Group
	{
		public var selectedItem:IGroupItem;

		public function Group()
		{
		}

		public function selectItem(item:IGroupItem):void
		{
			//重选还是反选
			if (selectedItem)
			{
				if (selectedItem == item)
				{
					selectedItem.reselectItem();
					return;
				}
				selectedItem.deselectItem();
			}
			
			//选中
			selectedItem = item;
			if (selectedItem)
			{
				selectedItem.selectItem();
			}
		}
		
		public function dispose():void
		{
			selectedItem = null;
		}
	}
}