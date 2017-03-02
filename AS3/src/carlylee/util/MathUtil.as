package carlylee.util
{
	/**
	 * MathUtil
	 *
	 * author: Eunjeong, Lee.(carly.l86@gmail.com).
	 * modified: Dec 10, 2013
	 */
	public class MathUtil
	{
		/**
		 * x,y좌표 사이의 거리가 distance보다 작은지 검사하여 반환 
		 * @param $x:Number   first x-coordinate
		 * @param $y:Number   first y-coordinate
		 * @param $toX:Number second x-coordinate
		 * @param $toY:Number second y-coordinate
		 * @param $distance:Number
		 * @return:Boolean
		 * 
		 */		
		public static function compareDistance( $x1:Number, $x2:Number, $y1:Number, $y2:Number, $distance:Number ):Boolean{
			var diffX:Number = $x2 - $x1;
			var diffY:Number = $y2 - $y1;
			return diffX*diffX + diffY*diffY < $distance*$distance;
		};
		
		/**
		 * returns angle from start coordinate to target coordinate 
		 * @param $x:Number   start x-coordinate
		 * @param $y:Number   start y-coordinate
		 * @param $toX:Number target x-coordinate
		 * @param $toY:Number target y-coordinate 
		 * @return:Number	   radian
		 * 
		 */		
		public static function takeAngleToRadian( $x:Number, $y:Number, $toX:Number, $toY:Number ):Number{
			var dx:Number = $toX - $x;
			var dy:Number = $toY - $y;
			var r:Number = Math.atan2( dy, dx );
			return r;
		}
		
		/**
		 * returns angle from start coordinate to target coordinate
		 * @param $x:Number   start x-coordinate
		 * @param $y:Number   start y-coordinate
		 * @param $toX:Number target x-coordinate
		 * @param $toY:Number target y-coordinate 
		 * @return:Number	   degree
		 * 
		 */			
		public static function takeAngleToDegree( $x:Number, $y:Number, $toX:Number, $toY:Number ):Number{
			var dx:Number = $toX - $x;
			var dy:Number = $toY - $y;
			var r:Number = Math.atan2( dy, dx );
			return RadiansToDegrees( r );
		}
		
		public static function pointToPixel( $point:Number, $dpi:int=96 ):Number{
			return $point*$dpi/72.27;
		}
		
		public static function pixelToPoint( $pixel:Number, $dpi:int=96 ):Number{
			return $pixel*72.27/$dpi;
		}
		
		public static function RadiansToDegrees( $radians:Number ):Number{
			return $radians*57.29577951308232;
		}
		
		public static function DegreesToRadiands( $degrees:Number ):Number{
			return $degrees*0.017453292519943295;
		}
	}
}
