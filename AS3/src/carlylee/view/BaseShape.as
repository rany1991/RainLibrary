package carlylee.view
{
	import flash.display.Sprite;

	public class BaseShape extends Sprite
	{
		public function BaseShape(){}
		
		protected function drawMain(): void{
			throw new Error( "'drawMain' method must be overridden." );
		}
		
		private var _fillAlpha: Number = 1;
		public function get fillAlpha(): Number
		{
			return this._fillAlpha;
		}
		public function set fillAlpha( value: Number ): void
		{
			this._fillAlpha = value;
			this.drawMain();
		}
		
		
		private var _fillColor: Number = 0;		
		public function  get  fillColor(): Number
		{
			return this._fillColor;
		}
		public function  set  fillColor( value: Number ): void
		{
			this._fillColor = value;
			this.drawMain();
		}
		
		
		private var _lineColor: Number = 0x000000;
		public function get lineColor(): Number
		{
			return this._lineColor;
		}
		public function set lineColor( value: Number ): void
		{
			this._lineColor = value;
			this.drawMain();
		}		
		
		private var _lineAlpha: Number = 1;
		public function get lineAlpha(): Number
		{
			return this._lineAlpha;
		}
		public function set lineAlpha( value: Number ): void
		{
			this._lineAlpha = value;
			this.drawMain();
		}		
		
		private var _lineThickness: Number = 1;
		public function get lineThickness(): Number
		{
			return this._lineThickness;
		}
		public function set lineThickness( value: Number ): void
		{
			this._lineThickness = value;
			this.drawMain();
		}		
	}
}