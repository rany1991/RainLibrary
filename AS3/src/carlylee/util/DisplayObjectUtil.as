package carlylee.util
{
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	/**
	 * DisplayObjectUtil
	 *
	 * author: Eunjeong, Lee.(carly.l86@gmail.com).
	 * created: Dec 10, 2013
	 */
	
	public class DisplayObjectUtil
	{
		/**
		 * You can remove a DisplayObject directly from Display List, not through several depth. 
		 * @param $displayObject What you want to remove from display.
		 * 
		 */		
		public static function removeFromDisplayList( $displayObject:DisplayObject ):void{
			if( $displayObject == null ){
				throw new Error( "Can not remove null Object. $displayObject is null." );
			}else{
				if( $displayObject.parent != null ) $displayObject.parent.removeChild( $displayObject );
			}
		}
		
		/**
		 * Set DisplayObject's color to $RGB value, using ColorTransform.
		 * @param $displayObject
		 * @param $RGBCode:uint
		 */		
		public static function setRGBColorToDisplayObject( $displayObject:DisplayObject, $RGBCode:uint ):void{
			var colorTransform:ColorTransform = new ColorTransform;
			colorTransform.color = $RGBCode;
			$displayObject.transform.colorTransform = colorTransform;
		}
		
		/**
		 * Set DisplayObject's color to GrayScale using ColorMatrixFilter.
		 * @param $displayObject
		 */		
		public static function setGrayScale( $displayObject:DisplayObject ):void{
			var colorMatrixFilter:ColorMatrixFilter = new ColorMatrixFilter([ 0.33, 0.33, 0.33, 0, 0,
																			  0.33, 0.33, 0.33, 0, 0,
																			  0.33, 0.33, 0.33, 0, 0,
																			  0,    0,    0,    1, 0 ]);
			$displayObject.filters = [ colorMatrixFilter ];
		}
		
		/**
		 * @param $displayObject1
		 * @param $displayObject2
		 * @return Boolean
		 */		
		public static function pixelHitTest( $displayObject1:DisplayObject, $displayObject2:DisplayObject ):Boolean{
			var b:Boolean = false;
			var rect1:Rectangle = $displayObject1.getBounds( $displayObject1.parent );
			var rect2:Rectangle = $displayObject2.getBounds( $displayObject2.parent );
			var bmd1:BitmapData = drawBitmapData( $displayObject1 );
			var bmd2:BitmapData = drawBitmapData( $displayObject2 );
			b = bmd1.hitTest( rect1.topLeft, 1, bmd2, rect2.topLeft, 1 );
			bmd1.dispose();
			bmd2.dispose();
			return b;
		}
		
		public static function drawBitmapData( $displayObject:DisplayObject ):BitmapData{
			var rect:Rectangle = $displayObject.getBounds( $displayObject );
			var bp:BitmapData = new BitmapData( rect.width, rect.height, true, 0 );
			var matrix:Matrix = new Matrix( 1, 0, 0, 1, -rect.x, -rect.y );
			bp.draw( $displayObject, matrix );
			return bp;
		}
	}
}