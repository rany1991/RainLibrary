package org.easily.test
{
	import org.easily.display.Container;
	import org.easily.ui.slider.HSliderEx;
	import org.easily.ui.slider.VSliderEx;
	
	public class SliderExTest extends Container
	{
		public function SliderExTest()
		{
			super();
			
			var slider:VSliderEx = new VSliderEx(this, 100, 100);
			var hlider:HSliderEx = new HSliderEx(this, 300, 300);
		}
	}
}