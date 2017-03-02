package carlylee.view
{
	import flash.display.DisplayObjectContainer;
	import flash.geom.Rectangle;
	import carlylee.view.object.CommandButton;
	
	
	public class ButtonLayout
	{
		private var _buttons:Vector.<CommandButton>;
		private var _rect:Rectangle;
		private var _padding:Number;
		private var _parent:DisplayObjectContainer;
		
		public function ButtonLayout( $rect:Rectangle, $padding:Number )
		{
			this._rect = $rect;
			this._padding = $padding;
			this._buttons = new Vector.<CommandButton>;
		}
		
		public function addButton( $btn:CommandButton ):uint{
			return _buttons.push( $btn );
		}
		
		public function attach( $parent:DisplayObjectContainer ):void{
			this._parent = $parent;
			var btn:CommandButton;
			for each( btn in this._buttons ){
				_parent.addChild( btn );
			}
		}
		
		public function layout():void{
			var btnX:Number = _rect.x + _padding;
			var btnY:Number = _rect.y;
			var btn:CommandButton;
			for each( btn in this._buttons ){
				btn.width = _rect.width - ( _padding*2 );
				btnY += this._padding;
				btn.x = btnX;
				btn.y = btnY;
				btnY += btn.height;
			}
		}
	}
}