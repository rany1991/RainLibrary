package org.easily.test
{
	import com.bit101.components.ColorChooser;
	import com.bit101.components.HUISlider;
	import com.bit101.components.List;
	import com.bit101.components.Panel;
	import com.bit101.components.ProgressBar;
	import com.bit101.components.Text;
	import com.bit101.components.VSlider;
	import com.bit101.components.VUISlider;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class MinimalCompTest extends Sprite
	{
		public function MinimalCompTest()
		{
			super();
			
			var data = []
			for (var i=0;i<100;i++)
			{
				data.push(i.toString())
			}
			
			var list:List = new List(this, 100, 100, data);
			list.alternateRows = true
			
			return
			
			var myProgressBar:ProgressBar = new ProgressBar(this, 230, 170);
			
			var myText:Text = new Text(this, 210, 220, "Text");
			
			var myVSlider:VSlider = new VSlider(this, 450, 230, sliderHandler);
			myVSlider.maximum = 0;
			myVSlider.minimum = 0;
			myVSlider.value = 50;
			function sliderHandler(e:Event):void
			{
				trace(e);
			}
			
			var myVUISlider:VUISlider = new VUISlider(this, 90, 200, "VUISlider");
			
			var myHUISlider:HUISlider = new HUISlider(this, 170, 70, "HUISlider");
			
			var myColorChooser:ColorChooser = new ColorChooser(this, 420, 110, 0xff0000);
		}
	}
}