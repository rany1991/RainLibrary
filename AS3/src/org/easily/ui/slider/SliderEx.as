package org.easily.ui.slider
{
	import com.bit101.components.Slider;
	import com.bit101.components.Style;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class SliderEx extends Slider
	{
		protected var _upButton:Sprite;
		protected var _downButton:Sprite;
		protected var _ui:Sprite;
		protected var _precision:Number;
		
		public function SliderEx(orientation:String=Slider.HORIZONTAL, parent:DisplayObjectContainer=null, xpos:Number=0, ypos:Number=0, defaultHandler:Function=null)
		{
			super(orientation, parent, xpos, ypos, defaultHandler);
		}
		
		protected override function init():void
		{
			//TODO Auto-generated method stub
			super.init();
			
			_precision = 10;
			var s:Number = 20;
			var l:Number = 200;

			if(_orientation == HORIZONTAL)
			{
				setSize(l, s);
			}
			else
			{
				setSize(s, l);
			}
		}
		
		protected override function addChildren():void
		{
			//TODO Auto-generated method stub
			super.addChildren();
			
			_upButton = new Sprite;
			_upButton.buttonMode = true;
			_upButton.useHandCursor = true;
			_upButton.addEventListener(MouseEvent.CLICK, onUpClick);
			addChild(_upButton);
			
			_downButton = new Sprite;
			_downButton.buttonMode = true;
			_downButton.useHandCursor = true;
			_downButton.addEventListener(MouseEvent.CLICK, onDownClick);
			addChild(_downButton);

			_ui = new Sprite;
			addChild(_ui);
		}
		
		private function onUpClick(event:MouseEvent):void
		{
			if(_orientation == HORIZONTAL)
			{
				moveHandler(_handle.x - _precision, 0);
			}
			else
			{
				moveHandler(0, _handle.y - _precision);
			}
		}
		
		private function onDownClick(event:MouseEvent):void
		{
			if(_orientation == HORIZONTAL)
			{
				moveHandler(_handle.x + _precision, 0);
			}
			else
			{
				moveHandler(0, _handle.y + _precision);
			}
		}
		
		private function drawButton():void
		{
			_upButton.graphics.clear();
			_downButton.graphics.clear();
			
			_upButton.graphics.beginFill(Style.BUTTON_FACE);
			_downButton.graphics.beginFill(Style.BUTTON_FACE);
			
			if(_orientation == HORIZONTAL)
			{
				_upButton.graphics.drawRect(-height, 0, height, height);
				_downButton.graphics.drawRect(width, 0, height, height);
			}
			else
			{
				_upButton.graphics.drawRect(0, -width, width, width);
				_downButton.graphics.drawRect(0, height, width, width);
			}
			
			_upButton.graphics.endFill();
			_downButton.graphics.endFill();
		}
		
		public override function draw():void
		{
			//TODO Auto-generated method stub
			super.draw();
			drawButton();
		}
	}
}