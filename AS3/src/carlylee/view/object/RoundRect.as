package carlylee.view.object
{
	import flash.display.Graphics;
	import carlylee.view.BaseShape;
	
	
	public class RoundRect extends BaseShape
	{
		private var _height: Number;
		private var _width: Number;
		private var _ew: Number;
		private var _eh: Number;		
		
		public function RoundRect( width: Number = 100, height: Number = 100, ew: Number = 20, eh: Number = 20 )
		{
			this._width = width;
			this._height = height;
			this._ew = ew;
			this._eh = eh;
			this.drawMain();
		}
		
		override protected function drawMain():void{
			var g: Graphics = this.graphics;
			g.clear();
			g.lineStyle( this.lineThickness, this.lineColor, this.lineAlpha, true );
			g.beginFill( this.fillColor, this.fillAlpha );
			g.drawRoundRect( 0, 0, this._width, this._height, this._ew, this._eh );
			g.endFill();
			
		}
		
		override public function set width( value: Number ): void
		{
			this._width = value;
			this.drawMain();
		}
		
	}
}
































