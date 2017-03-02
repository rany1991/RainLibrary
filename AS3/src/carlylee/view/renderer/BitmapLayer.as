package carlylee.view.renderer
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.geom.Point;
	
	
	/**
	 * BitmapLayer
	 *
	 * author: Eunjeong, Lee(carly.l86@gmail.com).
	 * created: Apr 16, 2014
	 */
	
	public class BitmapLayer extends Bitmap
	{
		private var _list:Vector.<Vector.<BitmapDataRenderModel>> = new Vector.<Vector.<BitmapDataRenderModel>>;
		private var _alphaBitmapData:BitmapData;
		
		public function BitmapLayer(bitmapData:BitmapData=null, pixelSnapping:String="auto", smoothing:Boolean=false)
		{
			super( bitmapData, pixelSnapping, smoothing );
			this._alphaBitmapData = new BitmapData( this.width, this.height, true, 0xFF000000 );
		}
		
		public function addRenderModel( $bitmapDataRenderModel:BitmapDataRenderModel ):void{
			while( $bitmapDataRenderModel.depth+1 > _list.length ){
				_list.push( new Vector.<BitmapDataRenderModel> );
			}
			_list[ $bitmapDataRenderModel.depth ].push( $bitmapDataRenderModel );			
		}
		
		public function removeRenderModel( $bitmapDataRenderModel:BitmapDataRenderModel ):void{
			var i:int = 0;
			var model:BitmapDataRenderModel;
			var v:Vector.<BitmapDataRenderModel> = _list[ $bitmapDataRenderModel.depth ];
			for( i; i<v.length; ++i ){
				model = v[i];
				if( model == null ) continue;
				if( model == $bitmapDataRenderModel ){
					v[i] = null;
					break;
				}
			}
		}
		
		public function startRender():void{
			this.addEventListener( Event.ENTER_FRAME, drawFrame );
		}
		
		public function stopRender():void{
			this.removeEventListener( Event.ENTER_FRAME, drawFrame );
		}
		
		private function drawFrame( $e:Event ):void{
			this.bitmapData.lock();
			this._alphaBitmapData.lock();
			this.bitmapData.fillRect( bitmapData.rect, 0 );
			this.deleteNull();
			
			var i:int, j:int = 0;
			var models:Vector.<BitmapDataRenderModel>;
			var model:BitmapDataRenderModel;
			var bd:BitmapData;
			var mp:Point = new Point();
			
			for( i; i<_list.length; ++i ){
				models = _list[i];
				if( models.length == 0 ) continue;
				for( j=0; j<models.length; ++j ){
					model = models[j];
					if( model == null || !model.visible ) continue;
					bd = model.getFrame();
					mp.x = model.x;
					mp.y = model.y;
					_alphaBitmapData.fillRect( bd.rect, 0XFF000000 );
					
					if( model.showAlpha ){
						if( model.addAlpha ){
							if( model.alpha < model.targetAlpha ){
								model.alpha += model.alphaStep;
							}else{
								model.showAlpha = false;
								model.endCallback();
							}
						}else{
							if( model.alpha > model.targetAlpha ){
								model.alpha -= model.alphaStep;
							}else{
								model.showAlpha = false;
								model.endCallback();
							}
						}
					}
					if( model.alpha > 10 ) model.alpha = 10;
					if( model.alpha < 0 ) model.alpha = 0;
					_alphaBitmapData.fillRect( bd.rect, ((model.alpha/10)*255)<<24 );
					this.bitmapData.copyPixels( bd, bd.rect, mp, _alphaBitmapData, null, true );
				}
			}
			
			this.bitmapData.unlock();
			this._alphaBitmapData.unlock();
		}
		
		private function deleteNull():void{
			var i:int = 0;
			for( i; i<_list.length; ++i ){
				_list[i] = _list[i].filter( deleteNullFilter, this );
			}
		}
		
		private function deleteNullFilter( item:*, index:int, vector:Vector.<*> ):Boolean{
			var b:Boolean = false;
			if( item != null ) b = true;
			return b;
		}
		
		public function destroy():void{
			if( this.hasEventListener( Event.ENTER_FRAME )){
				this.removeEventListener( Event.ENTER_FRAME, drawFrame );
			}
			this.bitmapData.dispose();
			this._alphaBitmapData.dispose();
			_list = null;
		}
	}
}