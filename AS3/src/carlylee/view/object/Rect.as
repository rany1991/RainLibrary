package carlylee.view.object
{
	import flash.display.Graphics;
	import carlylee.view.BaseShape;
	
	
	public class Rect extends BaseShape
	{
		private var _x: Number = 0;
		private var _y: Number = 0;
		private var _width: Number = 100;
		private var _height: Number = 100;
		
		public function Rect( width:Number = 100, height:Number = 100, x:Number = 0, y:Number = 0 )
		{
			super();
			this._width = width;
			this._height = height;
			this._x = x;
			this._y = y;
			this.drawMain();
		}
		
		override protected function drawMain(): void
		{
			var g: Graphics = this.graphics;
			g.clear();
			if( this.lineAlpha > 0 ){
				g.lineStyle( this.lineThickness, this.lineColor, this.lineAlpha, true );
			}
			g.beginFill( this.fillColor, this.fillAlpha );
			g.drawRect( _x, _y, this._width, this._height );
			g.endFill();
		}
		
	}
}

















