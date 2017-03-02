package org.easily.test
{
	import org.easily.ui.tab.TabPage;
	
	public class Page1 extends TabPage
	{
		// public static var xx = Easily.xxx.xx;
		
		public function Page1(color:uint)
		{
			super();
			
			graphics.beginFill(color);
			graphics.drawRect(0,0,100,200);
			graphics.endFill();
		}
		
		override public function deselectItem():void
		{
			// TODO Auto Generated method stub
			visible = false
		}
		
		override public function selectItem():void
		{
			// TODO Auto Generated method stub
			visible = true
		}
	}
}