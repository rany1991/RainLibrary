package org.easily.com.tilelist
{
	import org.easily.display.Container;
	import org.easily.utils.ArrayUtils;

	/**
	 * @author Easily
	 */
	public class TileList extends Container 
	{
		protected var mHgap:Number;
		protected var mVgap:Number;
		protected var mItemClass:Class;
		protected var mData:Array;
		protected var mItemList:Array = [];
		protected var mRow:int;
		protected var mCol:int;
		
		public function TileList(hgap:Number, vgap:Number, itemClass:Class)
		{
			super();
			
			mHgap = hgap;
			mVgap = vgap;
			mItemClass = itemClass;
		}
		
		public function setData(data:Array, row:int, col:int):void
		{
			if (data)
			{
				clearItems();
				mData = data;
				mRow = row;
				mCol = col;
				
				var len:int = data.length;
				for (var i:int = 0; i < data.length; i++) 
				{
					createItem(i,TileItem(new mItemClass),data[i]);
				}
				layout();
			}
		}
		
		public function layout():void
		{
			var index:int = 0;
			var len:int = mData.length;
			for (var i:int = 0; i < mRow; ++i)
			{
				for (var j:int = 0; j < mCol; ++j)
				{
					if (index != len) 
					{
						var item:TileItem = getItem(index++);
						item.x = mHgap * j;
						item.y = mVgap * i;
					}
				}
			}
		}
		
		public function getData():Array
		{
			return mData;
		}
		
		public function forEach(func:Function, from:int = 0, to:int = -1):void
		{
			if (to == -1)
			{
				to = mItemList.length - 1;
			}
			for (var i:int = from; i <= to; i++) 
			{
				func(mItemList[i]);
			}
		}
		
		protected function createItem(index:int, item:TileItem, data:Object):TileItem
		{
			item.setIndex(index);
			item.addEventListener(TileEvent.CLICK, onClick);
			item.addEventListener(TileEvent.MOUSE_DOWN, onItemDown);
			item.addEventListener(TileEvent.MOUSE_UP, onItemUp);
			item.addEventListener(TileEvent.ROLL_OVER, onRollOver);
			item.addEventListener(TileEvent.ROLL_OUT, onRollOut);
			item.addEventListener(TileEvent.DOUBLE_CLICK, onDoubleClick);
			
			mItemList.push(addChild(item));
			item.setData(data);
			
			return item;
		}
		
		protected function onItemDown(event:TileEvent):void
		{
			dispatchEvent(new TileEvent(TileEvent.MOUSE_DOWN, event.item));
		}
		
		protected function onItemUp(event:TileEvent):void
		{
			dispatchEvent(new TileEvent(TileEvent.MOUSE_UP, event.item));
		}
		
		protected function onClick(event:TileEvent):void
		{
			dispatchEvent(new TileEvent(TileEvent.CLICK, event.item));
		}

		protected function onRollOver(event:TileEvent):void
		{
			dispatchEvent(new TileEvent(TileEvent.ROLL_OVER, event.item));
		}

		protected function onRollOut(event:TileEvent):void
		{
			dispatchEvent(new TileEvent(TileEvent.ROLL_OUT, event.item));
		}
		
		protected function onDoubleClick(event:TileEvent):void
		{
			dispatchEvent(new TileEvent(TileEvent.DOUBLE_CLICK, event.item));
		}

		public function getItems():Array
		{
			return mItemList;
		}

		public function getItemCount():uint
		{
			return mItemList.length;
		}

		public function hasItem():Boolean
		{
			return mItemList.length > 0;
		}
		
		public function getLength():int
		{
			return mItemList.length;
		}
		
		public function getItem(index:int = 0):*
		{
			if (index < 0 || index >= mItemList.length || !hasItem())
			{
				return null;
			}
			return mItemList[index];
		}
		
		public function clearItems():void
		{
			for each (var item:TileItem in mItemList.concat())
			{
				removeItem(item);
			}
			mItemList.length = 0;
			mData = null;
		}
		
		public function removeItem(item:TileItem):void
		{
			ArrayUtils.remove(mItemList, item);
			ArrayUtils.remove(mData, item.getData());
			removeChild(item);
			
			item.removeEventListener(TileEvent.CLICK, onClick);
			item.removeEventListener(TileEvent.MOUSE_DOWN, onItemDown);
			item.removeEventListener(TileEvent.MOUSE_UP, onItemUp);
			item.removeEventListener(TileEvent.ROLL_OVER, onRollOver);
			item.removeEventListener(TileEvent.ROLL_OUT, onRollOut);
			item.removeEventListener(TileEvent.DOUBLE_CLICK, onDoubleClick);
			item.dispose();
		}
		
		override public function dispose():void
		{
			// TODO Auto Generated method stub
			clearItems();
			mItemList = null;
			mItemClass = null;
			
			super.dispose();
		}
	}
}
