package carlylee.view.renderer
{
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	/**
	 * BitmapDataRenderModel
	 *
	 * author: Eunjeong, Lee(carly.l86@gmail.com).
	 * created: Apr 16, 2014
	 */
	
	public class BitmapDataRenderModel extends EventDispatcher
	{
		public var x:int = 0;
		public var y:int = 0;
		public var depth:int = 0;
		public var visible:Boolean = true;
		
		internal var eventDispatch:Boolean = false;
		internal var alphaStep:Number = 0; // 투명도를 더하거나 뺄 때 단위값.
		internal var showAlpha:Boolean = false;
		internal var targetAlpha:Number = 10;
		internal var addAlpha:Boolean = false;
		
		private var _image:BitmapData;
		private var _alpha:Number = 10;
		
		public function BitmapDataRenderModel(){}
		
		/**
		 * @param $obj
		 * $obj.bitmapData:BitmapData
		 */		
		public function init( $obj:Object ):void{
			_image = $obj.bitmapData;
		}
		
		public function get alpha():Number{
			return _alpha;
		}
		
		/**
		 * @param $alpha 0 to 10.
		 */		
		public function set alpha( $alpha:Number ):void{
			this._alpha = $alpha;
			this.showAlpha = true;
		}
		
		public function playSubtractAlpha( $startAlpha:Number=10, $targetAlpha:Number=0, 
										   $alphaStep:Number=1, $completeEventDispatch:Boolean=false ):void{
			_alpha = $startAlpha;
			targetAlpha = $targetAlpha;
			alphaStep = $alphaStep;
			showAlpha = true;
			addAlpha = false;
			eventDispatch = $completeEventDispatch;
		}
		
		public function playAddAlpha( $startAlpha:Number=0, $targetAlpha:Number=10, 
									  $alphaStep:Number=1, $completeEventDispatch:Boolean=false ):void{
			_alpha = $startAlpha;
			targetAlpha = $targetAlpha;
			alphaStep = $alphaStep;
			showAlpha = true;
			addAlpha = true;
			eventDispatch = $completeEventDispatch;
		}
		
		internal function getFrame():BitmapData{
			return _image;
		}
		
		internal function endCallback():void{
			if( !eventDispatch ) return;
			eventDispatch = false;
			this.dispatchEvent( new Event( Event.COMPLETE ));
		}
		
		public function destroy():void{
			_image.dispose();
		}
	}
}