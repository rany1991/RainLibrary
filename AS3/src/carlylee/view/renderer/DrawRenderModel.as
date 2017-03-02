package carlylee.view.renderer
{
	import flash.display.BitmapData;
	
	
	/**
	 * DrawRenderModel
	 *
	 * author: Eunjeong, Lee(carly.l86@gmail.com).
	 * created: Apr 21, 2014
	 */
	
	public class DrawRenderModel extends BitmapDataRenderModel implements IBitmapRenderable
	{
		private var _target:IBitmapRenderable;
		
		public function DrawRenderModel(){}
		
		/**
		 * @param $obj
		 * $obj.target:IBitmapRenderable
		 */		
		public override function init( $obj:Object ):void{
			_target = $obj.target;
		}
		
		public function drawFrame():BitmapData{
			return _target.drawFrame();
		}
	}
}