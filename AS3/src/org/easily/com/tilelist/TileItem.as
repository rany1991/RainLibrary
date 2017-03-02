package org.easily.com.tilelist
{
	import flash.events.MouseEvent;
	
	import org.easily.display.Container;
	import org.easily.ticker.TimeTicker;

	/**
	 * @author Easily
	 */
	public class TileItem extends Container 
	{
		protected var mData:*;
		protected var index:int;
		protected var doubleClick:Boolean = false;
		protected var oneClick:Boolean = false;
		protected var clickTimer:int;
		
		public function TileItem()
		{
			super();
			
			addEventListener(MouseEvent.CLICK, onItemClick);
			addEventListener(MouseEvent.MOUSE_DOWN, onItemDown);
			addEventListener(MouseEvent.MOUSE_UP, onItemUp);
			addEventListener(MouseEvent.ROLL_OVER, onItemOver);
			addEventListener(MouseEvent.ROLL_OUT, onItemOut);
		}
		
		public function setIndex(index_:int):void
		{
			index = index_;
		}
		
		public function getIndex():int
		{
			return index;
		}

		public function setData(data:*):void
		{
			mData = data;
		}
		
		public function getData():*
		{
			return mData;
		}

		protected function onItemClick(event:MouseEvent):void
		{
			event.stopPropagation();
			
			if (!doubleClick)
			{
				dispatchEvent(new TileEvent(TileEvent.CLICK, this));
				return;
			}
			
			if (oneClick)
			{
				TimeTicker.clearTimeout(clickTimer);
				oneClick = false;
				dispatchEvent(new TileEvent(TileEvent.DOUBLE_CLICK, this));
				return;
			}
			
			oneClick = true;
			var item:TileItem = this;
			clickTimer = TimeTicker.setTimeout(TileConsts.DOUBLE_CLICK_DELAY, cancelDouble);
			function cancelDouble():void
			{
				oneClick = false;
				dispatchEvent(new TileEvent(TileEvent.CLICK, item));
			}
		}
		
		protected function onItemDown(event:MouseEvent):void
		{
			dispatchEvent(new TileEvent(TileEvent.MOUSE_DOWN, this));
		}
		
		protected function onItemUp(event:MouseEvent):void
		{
			dispatchEvent(new TileEvent(TileEvent.MOUSE_UP, this));
		}

		protected function onItemOver(event:MouseEvent):void
		{
			dispatchEvent(new TileEvent(TileEvent.ROLL_OVER, this));
		}
		
		protected function onItemOut(event:MouseEvent):void
		{
			dispatchEvent(new TileEvent(TileEvent.ROLL_OUT, this));
		}
		
		override public function dispose():void
		{
			TimeTicker.clearTimeout(clickTimer);
			removeEventListener(MouseEvent.CLICK, onItemClick);
			removeEventListener(MouseEvent.MOUSE_DOWN, onItemDown);
			removeEventListener(MouseEvent.MOUSE_UP, onItemUp);
			removeEventListener(MouseEvent.ROLL_OVER, onItemOver);
			removeEventListener(MouseEvent.ROLL_OUT, onItemOut);
			mData = null;
			
			super.dispose();
		}
	}
}
