package org.easily.ui.tab
{
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	
	import org.easily.ui.group.Group;
	import org.easily.utils.DictionaryUtils;

	/**
	 * @author Easily
	 */
	public class TabCtrl extends EventDispatcher
	{
		public var tabMap:Dictionary;
		public var labelGroup:Group;
		public var pageGroup:Group;
		
		public function TabCtrl()
		{
			super();
			
			tabMap = new Dictionary();
			labelGroup = new Group();
			pageGroup = new Group();
		}
		
		public function addPage(tabLabel:TabLabel, tabPage:TabPage):void
		{
			tabMap[tabLabel] = tabPage;
			labelGroup.selectItem(tabLabel);
			pageGroup.selectItem(tabPage);
			tabLabel.addEventListener(MouseEvent.CLICK, onClickLabel);
		}
		
		public function removePage(tabLabel:TabLabel, openFirst:Boolean = true):void
		{
			tabLabel.removeEventListener(MouseEvent.CLICK, onClickLabel);
			tabLabel.dispose();
			tabMap[tabLabel].dispose();
			delete tabMap[tabLabel];
			
			if (openFirst)
			{
				var tabs:Array = DictionaryUtils.getKeys(tabMap);
				if (tabs.length > 0)
				{
					changeTab(tabs[0]);
				}
			}
		}
		
		public function getTabMap():Dictionary
		{
			return tabMap;
		}
		
		public function selectedLabel():TabLabel
		{
			return TabLabel(labelGroup.selectedItem);
		}
		
		public function selectedPage():TabPage
		{
			return TabPage(pageGroup.selectedItem);
		}
		
		private function onClickLabel(event:MouseEvent):void
		{
			changeTab(TabLabel(event.currentTarget));
		}
		
		public function changeTab(tabLabel:TabLabel):void
		{
			var event:TabEvent = new TabEvent(TabEvent.PRE_CHNAGE);
			dispatchEvent(event);
			if (event.cancel)
			{
				return;
			}
			
			labelGroup.selectItem(tabLabel);
			pageGroup.selectItem(tabMap[tabLabel]);
			dispatchEvent(new TabEvent(TabEvent.CHANGE_TAB));
		}

		public function dispose():void
		{
			if (labelGroup)
			{
				labelGroup.dispose();
				labelGroup = null;
			}
			if (pageGroup)
			{
				pageGroup.dispose();
				pageGroup = null;
			}
			for each (var tabLabel:TabLabel in DictionaryUtils.getKeys(tabMap))
			{
				removePage(tabLabel, false);
			}
			if (tabMap)
			{
				DictionaryUtils.dispose(tabMap);
				tabMap = null;
			}
		}
	}
}
