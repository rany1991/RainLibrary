package carlylee.data.manager
{
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	
	/**
	 * BitmapDataStorage
	 * This is simple storage has BitmapData.
	 * You can save BitmapData and pull it out to use.
	 * 
	 * author: Eunjeong, Lee.
	 * created: Dec 10, 2013
	 */
	
	public class BitmapDataStorage
	{
		private static var _storage:Dictionary = new Dictionary();
		
		public static function saveDisplayObejctToBitmapData( $key:String, $displayObject:DisplayObject ):void{
			var rect:Rectangle = $displayObject.getBounds( $displayObject );
			var bp:BitmapData = new BitmapData( rect.width, rect.height, true, 0 );
			var matrix:Matrix = new Matrix( 1, 0, 0, 1, -rect.x, -rect.y );
			bp.draw( $displayObject, matrix );
			_storage[ $key ] = bp;
		}
		
		public static function save( $key:String, $bitmapData:BitmapData ):void{
			_storage[ $key ] = $bitmapData;
		}
		
		public static function saveVector( $key:String, $bitmapDataVector:Vector.<BitmapData> ):void{
			_storage[ $key ] = $bitmapDataVector;
		}
		
		public static function pull( $key:String ):BitmapData{
			if( _storage[ $key ] == null ){
				trace( "BitmapDataStorage["+$key+"] is null." );
				return null;
			}
			return _storage[ $key ];
		}
		
		public static function pullVector( $key:String ):Vector.<BitmapData>{
			if( _storage[ $key ] == null ){
				trace( "BitmapDataStorage["+$key+"] is null." );
				return null;
			}
			return _storage[ $key ];
		}
		
		public static function deleteBitmapData( $key:String ):void{
			delete _storage[ $key ];
		}
	}
}
