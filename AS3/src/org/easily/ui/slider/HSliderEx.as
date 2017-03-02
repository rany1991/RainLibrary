package org.easily.ui.slider
{
	import com.bit101.components.Slider;
	
	import flash.display.DisplayObjectContainer;
	
	public class HSliderEx extends SliderEx
	{
		public function HSliderEx(parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0, defaultHandler:Function=null)
		{
			super(Slider.HORIZONTAL, parent, xpos, ypos, defaultHandler);
		}
	}
}