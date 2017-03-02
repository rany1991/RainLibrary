package org.easily.com.flowlist
{
	import org.easily.display.Container;

	/**
	 * @author Easily
	 */
	public class FlowList extends Container 
	{
		public static const HORIZONTAL:int = 0;
		public static const VERTICAL:int = 1;
		public static const DEFAULT_GAP:int = 15;
		
		protected var mAlign:int;
		protected var mGap:Number;
		protected var mItemClass:Class;
		protected var mItemList:Array;
		
		public function FlowList(itemClass:Class, align:int = HORIZONTAL, gap:Number = DEFAULT_GAP)
		{
			mItemClass = itemClass;
			mAlign = align;
			mGap = gap;
			
			mItemList = [];
		}
		
		public function setData(data:Array):void
		{
			if (data == null || data.length == 0)
			{
				return;
			}
			
			cleanItems();
			
			var dis:Number = 0;
			for each (var _data:* in data)
			{
				var item:FlowItem = createItem(FlowItem(new mItemClass()), _data);
				
				var index:int = getChildIndex(item);
				switch (mAlign)
				{
					case HORIZONTAL:
						if (index != 0)
						{
							item.x = dis;
						}
						dis += (item.width + mGap);
						break;
					case VERTICAL:
						if (index != 0)
						{
							item.y = dis;
						}
						dis += (item.height + mGap);
						break;
					default:
						break;
				}
			}
		}
		
		protected function createItem(item:FlowItem, data:Object):FlowItem
		{
			item.addEventListener(FLowEvent.CLICK, onClick);
			item.addEventListener(FLowEvent.ROLL_OVER, onRollOver);
			item.addEventListener(FLowEvent.ROLL_OUT, onRollOut);
			
			item.setData(data);
			mItemList.push(addChild(item));
			
			return item;
		}
		
		private function onClick(event:FLowEvent):void
		{
			event.stopPropagation();
			
			dispatchEvent(new FLowEvent(FLowEvent.CLICK, event.data));
		}

		private function onRollOver(event:FLowEvent):void
		{
			event.stopPropagation();
			
			dispatchEvent(new FLowEvent(FLowEvent.ROLL_OVER, event.data));
		}

		private function onRollOut(event:FLowEvent):void
		{
			event.stopPropagation();
			
			dispatchEvent(new FLowEvent(FLowEvent.ROLL_OUT, event.data));
		}

		public function getItems():Array
		{
			return mItemList;
		}

		public function hasItem():Boolean
		{
			return mItemList.length > 0;
		}

		public function getItemCount():uint
		{
			return mItemList.length;
		}
		
		public function getLength():int
		{
			return mItemList.length;
		}
		
		public function getItem(index:int = 0):FlowItem
		{
			if (index < 0 || index >= mItemList.length || !hasItem())
			{
				return null;
			}
			
			return mItemList[index];
		}
		
		private function cleanItems():void
		{
			while (numChildren != 0)
			{
				removeItem(FlowItem(removeChildAt(0)));
			}
			mItemList.length = 0;
		}
		
		protected function removeItem(item:FlowItem):void
		{
			item.addEventListener(FLowEvent.CLICK, onClick);
			item.addEventListener(FLowEvent.ROLL_OVER, onRollOver);
			item.addEventListener(FLowEvent.ROLL_OUT, onRollOut);
			item.dispose();
		}
		
		override public function dispose():void
		{
			// TODO Auto Generated method stub
			cleanItems();
			mItemList = null;
			mItemClass = null;
			
			super.dispose();
		}
	}
}
