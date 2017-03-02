package org.easily.com.flowlist
{
	import flash.events.MouseEvent;
	
	import org.easily.display.Container;

	/**
	 * @author Easily
	 */
	public class FlowItem extends Container 
	{
		protected var mData:*;
		
		public function FlowItem()
		{
			addEventListener(MouseEvent.CLICK, onItemClick);
			addEventListener(MouseEvent.ROLL_OVER, onItemOver);
			addEventListener(MouseEvent.ROLL_OUT, onItemOut);
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
			
			dispatchEvent(new FLowEvent(FLowEvent.CLICK, this));
		}

		protected function onItemOver(event:MouseEvent):void
		{
			event.stopPropagation();
			
			dispatchEvent(new FLowEvent(FLowEvent.ROLL_OVER, this));
		}
		
		protected function onItemOut(event:MouseEvent):void
		{
			event.stopPropagation();
			
			dispatchEvent(new FLowEvent(FLowEvent.ROLL_OUT, this));
		}
		
		override public function dispose():void
		{
			// TODO Auto Generated method stub
			removeEventListener(MouseEvent.CLICK, onItemClick);
			removeEventListener(MouseEvent.ROLL_OVER, onItemOver);
			removeEventListener(MouseEvent.ROLL_OUT, onItemOut);
			mData = null;
			
			super.dispose();
		}
	}
}
