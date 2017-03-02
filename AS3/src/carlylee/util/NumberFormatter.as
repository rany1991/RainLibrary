package carlylee.util
{
	/**
	 * NumberFormatter
	 * 
	 * author: Eunjeong, Lee(carly.l86@gmail.com).
	 * created: July 10, 2014.
	 * recent updated: October 29, 2014.
	 */
	public class NumberFormatter
	{
		/**
		 * 1234567.85256 -> 1,234,567.85256
		 * @param $num
		 * @param $digit(default=0) 1234567.85256 -> 1,234,567
		 * @param $round(true)
		 * @return 
		 */		
		public static function withCommas( $num:Number, $digit:int=0, $round:Boolean=true ):String{
			var largeNumber:String = String( $num );
			var front:Array = largeNumber.split(".");
			var reg:RegExp=/\d{1,3}(?=(\d{3})+(?!\d))/g;
			front[0] = front[0].replace( reg,"$&," );
			if( $digit > 0 ){
				if( $round ){
					var pow:int = Math.pow( 10, $digit );
					var str:String = String( Math.round($num*pow)/pow );
					front[1] = str.split( "." )[1];
				}else{
					if( front[1] == undefined ) front[1] = "0";
					front[1] = front[1].substr( 0, $digit );
				}
				if( front[1] == undefined ) front[1] = "0";
				while( front[1].length<$digit ) front[1] += "0";
			}else front.splice( 1, 1 );
			return front.join(".");
		}
		
		/**
		 * 1000 -> 1k
		 * 1000000 -> 1m
		 * 1000000000 -> 1b
		 * 1000000000000 -> 1t
		 * 
		 * @param $num
		 * @param $capital(false)	
		 * @param $digit(default=2)		1.82k
		 * @param $round(true)			1.76k -> 1.8k
		 * @param $start(default=1000)  				
		 * @param $iteration			
		 * @return 
		 */		
		public static function withChar( $num:Number, $capital:Boolean=false, $digit:int=2, $round:Boolean=true, $start:int=1000, $iteration:int=0 ):String{
			if( $num < $start ) return withCommas( $num, 0, $round );
			var char:String = "kmbt";
			if( $capital ) char = "KMBT";
			var i:int = 0;
			var n:int = 1000;
			for( i; i<$iteration; i++ ){
				n = n*1000;
			}
			$num = $num/n;
			while( $num>=1000 && $iteration<char.length ){
				$num = $num/1000;
				$iteration ++;
			}
			var pow:int = Math.pow( 10, $digit );
			if( $round ) $num = Math.round( $num*pow )/pow;
			else $num = int( $num*pow )/pow;
			return withCommas( $num, $digit, false ) + char.charAt( $iteration );
		}
		
		public static function addOrdinal( $order:int ):String{
			if (( $order % 100 < 20 ) && ( $order % 100 > 10 )) {
				return "th";
			}else{
				switch (int($order%10)) {
					case 1:
						return "st";
					case 2:
						return "nd";
					case 3:
						return "rd";
				}
			}
			return "th";
		}
		
		/**
		 * @param $seconds:int 				31536000
		 * @param $isMillisecond:Boolean	Is '$seconds' millisecond? 
		 * @return:Number 					1. Returns only year.
		 */	
		public static function timeFormatYear( $seconds:Number, $isMillisecond:Boolean=false ):Number {
			if( $isMillisecond ) return Math.floor( $seconds/31536000000 );
			else return Math.floor( $seconds/31536000 );  
		}
		
		/**
		 * @param $seconds:int 				18144000
		 * @param $isMillisecond:Boolean	Is '$seconds' millisecond? 
		 * @return:Number 					1. Returns only month.
		 */	
		public static function timeFormatMonth( $seconds:Number, $isMillisecond:Boolean=false ):Number {
			if( $isMillisecond ) return Math.floor( $seconds/18144000000 );
			else return Math.floor( $seconds/18144000 ); 
		}
		
		/**
		 * @param $seconds:int 				604800
		 * @param $isMillisecond:Boolean	Is '$seconds' millisecond? 
		 * @return:Number 					1. Returns only week.
		 */	
		public static function timeFormatWeek( $seconds:Number, $isMillisecond:Boolean=false ):Number {
			if( $isMillisecond )  return Math.floor( $seconds/604800000 );
			else return Math.floor( $seconds/604800 );
		}
		
		/**
		 * @param $seconds:int 				86400
		 * @param $isMillisecond:Boolean	Is '$seconds' millisecond? 
		 * @return:Number 					1. Returns only day.
		 */	
		public static function timeFormatDay( $seconds:Number, $isMillisecond:Boolean=false ):Number {
			if( $isMillisecond )  return Math.floor( $seconds/86400000 );
			else return Math.floor( $seconds/86400 );
		}
		
		/**
		 * @param $seconds:int 				3600
		 * @param $isMillisecond:Boolean	Is '$seconds' millisecond? 
		 * @return:Number 					1. Returns only hour.
		 */		
		public static function timeFormatHour( $seconds:Number, $isMillisecond:Boolean=false ):Number{
			if( $isMillisecond ) return Math.floor( int(( $seconds/3600000 )+1));
			else return Math.floor( int(( $seconds/3600 )+1));
		}
		
		/**
		 * @param $seconds:int 				9900
		 * @param $isMillisecond:Boolean 	Is '$seconds' millisecond? 
		 * @return:Number					165 only returns minutes.
		 */		 
		public static function timeFormatMin( $seconds:int, $isMillisecond:Boolean=false ):Number{
			if( $isMillisecond ) return Math.floor( $seconds/60000 );
			else return Math.floor( $seconds/60 ); 
		}
	}
}