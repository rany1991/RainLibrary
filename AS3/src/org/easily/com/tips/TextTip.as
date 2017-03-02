package org.easily.com.tips
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	
	/**
	 * @author Easily
	 */
	public class TextTip extends ToolTip 
	{
		private static var sInstance:TextTip = new TextTip();
		
		public static function getInstance():TextTip
		{
			return sInstance;
		}
		
		private var textField:TextField;
		
		public function TextTip()
		{
			super();
			
			textField = new TextField();
			textField.textColor = 0xffffff;
			body.addChild(textField);
		}
		
		override public function updateTip(data:Object):void
		{
			textField.text = String(data);
			textField.width = textField.textWidth + 3;
			textField.height = textField.textHeight + 3;
			textField.x = 2.5;	
			
			body.graphics.clear();
			body.graphics.lineStyle(1, 0xffffff, 1, true);
			body.graphics.beginFill(0x213e51, 0.8);
			body.graphics.drawRoundRect(0, 0, textField.width + 5, textField.height, 12);
			body.graphics.endFill();		
		}
	}
}