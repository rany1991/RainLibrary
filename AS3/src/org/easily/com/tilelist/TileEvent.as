package org.easily.com.tilelist
{
	import flash.events.Event;

	/**
	 * @author Easily
	 */
	public class TileEvent extends Event
	{
		public static const CLICK:String = "tile_item_click";
		public static const MOUSE_DOWN:String = "tile_mouse_down";
		public static const MOUSE_UP:String = "tile_mouse_up";
		public static const DOUBLE_CLICK:String = "tile_item_double_click";
		public static const ROLL_OVER:String = "tile_item_roll_over";
		public static const ROLL_OUT:String = "tile_item_roll_out";

		public var item:TileItem;

		public function TileEvent(type:String, item_:TileItem = null, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);

			item = item_;
		}
	}
}
