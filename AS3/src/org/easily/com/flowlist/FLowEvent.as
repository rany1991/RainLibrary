package org.easily.com.flowlist
{
	import Boolean;
	import String;
	import flash.events.Event;
	/**
	 * @author Easily
	 */
	public class FLowEvent extends Event 
	{
		public static const CLICK:String = "flow_item_click";
		public static const ROLL_OVER:String = "flow_item_roll_over";
		public static const ROLL_OUT:String = "flow_item_roll_out";
		
		public var data:*;
		
		public function FLowEvent(type:String, _data:*=null, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
			
			data = _data;
		}
	}
}
