package org.rany.utils
{
	import flash.filters.BitmapFilter;
	import flash.filters.GlowFilter;

	public class GameResConfig
	{
		public function GameResConfig()
		{
		}
		
		public static const FILTER_GLOW_BLACK:Array = [new GlowFilter(0x000000, 1, 2, 3, 10, 1, false, false)];
		public static const UIBIN_FILTER_GLOW_BLACK:Array = [new GlowFilter(0x000000, 1, 2, 3, 3, 1, false, false)];
		public static const FILTER_SELECT_RED:BitmapFilter = new GlowFilter(0x0000, 1, 4, 4, 3);
	}
}