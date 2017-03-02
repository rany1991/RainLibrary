package org.easily.test
{
	import flash.filters.GlowFilter;
	
	import org.easily.ui.tab.TabLabel;
	
	public class Label1 extends TabLabel
	{
		public function Label1(color:uint)
		{
			super();
			
			graphics.beginFill(color);
			graphics.drawRect(0,0,100,100);
			graphics.endFill();
		}
		
		override public function deselectItem():void
		{
			// TODO Auto Generated method stub
			filters = []
		}
		
		override public function selectItem():void
		{
			// TODO Auto Generated method stub
			filters = [new GlowFilter()]
		}
	}
}