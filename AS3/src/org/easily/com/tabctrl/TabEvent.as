package org.easily.com.tabctrl
{
	import flash.events.Event;
	/**
	 * @author Easily
	 */
	public class TabEvent extends Event 
	{
		public static const PRE_CHNAGE:String = "tab_before_select";
		public static const CHANGE_TAB:String = "tab_select_tab";
		
		public var cancel:Boolean = false;
		
		public function TabEvent(type:String, _cancel:Boolean = false, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
			
			cancel = _cancel;
		}
	}
}
