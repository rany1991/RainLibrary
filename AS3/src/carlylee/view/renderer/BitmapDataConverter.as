package carlylee.view.renderer
{
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	/**
	 * BitmapDataConverter
	 * 
	 * How to use :
	 * var v:Vector.<BitmapData> = BitmapDataConverter.fromMovieClip( MovieClip );
	 *
	 * author: Eunjeong, Lee(carly.l86@gmail.com).
	 * created: Mar 28, 2014
	 */
	
	public class BitmapDataConverter
	{
		public static function fromDisplayObject( $displayObject:DisplayObject ):BitmapData{
			return draw( $displayObject );
		}
		
		public static function fromMovieClip( $mc:MovieClip ):Vector.<BitmapData>{
			var i:int = 0;
			var len:int = $mc.totalFrames;
			var v:Vector.<BitmapData> = new Vector.<BitmapData>;
			for( i; i<len; ++i ){
				v.push( draw( $mc ));
				if( i<len-1 ) moveNextFrame( $mc );
			}
			return v;
		}
		
		private static function moveNextFrame( $mc:MovieClip, $depth:int=0 ):void{
			if( $mc.currentFrame == $mc.totalFrames ){
				$mc.gotoAndStop( 1 );
			}else{
				$mc.nextFrame();
			}
			var i:int = 0;
			var len:int = $mc.numChildren;
			var child:MovieClip;
			for( i; i<len; ++i ){
				child = $mc.getChildAt( i ) as MovieClip;
				if( child!=null && $depth<5 ){
					moveNextFrame( child, $depth+1 );
				}
			}
		}
		
		private static function draw( $displayObject:DisplayObject ):BitmapData{
			var rect:Rectangle = $displayObject.getBounds( $displayObject );
			var bp:BitmapData = new BitmapData( rect.width, rect.height, true, 0 );
			var matrix:Matrix = new Matrix( 1, 0, 0, 1, -rect.x, -rect.y );
			bp.draw( $displayObject, matrix );
			return bp;
		}
	}
}