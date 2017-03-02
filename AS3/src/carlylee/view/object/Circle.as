package carlylee.view.object
{
	import flash.display.Graphics;
	import carlylee.view.BaseShape;
	

	/**
	 *@Author Eunjeong Lee
	 *@Date Mar 30, 2012
	 */
	public class Circle extends BaseShape
	{
		private var _x: Number = 0;
		private var _y: Number = 0;
		private var _radius: Number = 100;
		
		public function Circle( radius:Number = 100, x:Number=0, y:Number=0 )
		{
			this._radius = radius;
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
			g.drawCircle( _x, _y, this._radius );
			g.endFill();
		}
	}
}