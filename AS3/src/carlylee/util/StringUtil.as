package carlylee.util
{
	import flash.utils.ByteArray;
	/**
	 * StringUtil
	 *
	 * author: Eunjeong, Lee.
	 * modified: Dec 10, 2013
	 */
	public class StringUtil
	{
		/**
		 * Get rid of space from $string and returns.
		 * @param $value
		 * @return:String  
		 */		
		public static function trim( $value:String ):String{
			var reg:RegExp = /^\s+|\s+$/g;
			return $value.replace( reg, "" );
		}
		
		/**
		 * 
		 * @param $string1
		 * @param $string2
		 * @param $caseSensitive(false)
		 * @return 
		 */		
		public static function sortInAlphabeticalOrder( $string1:String, $string2:String, $caseSensitive:Boolean=false ):int{
			if( !$caseSensitive ){
				$string1 = $string1.toLowerCase();
				$string2 = $string2.toLowerCase();
			}
			var i:int = -1;
			var len:int = ($string1.length<$string2.length) ? $string1.length : $string2.length;
			while( ++i<len ){
				if( $string1.charCodeAt(i) < $string2.charCodeAt(i) ) return -1;
				else if( $string1.charCodeAt(i) > $string2.charCodeAt(i) ) return 1; 
			}
			return 0;
		}
		
		/**
		 * Number -> Hexadecimal
		 * @param value:int
		 * @param length:int(6)		
		 * @param header:String
		 * @return:String 
		 * 
		 */		
		public static function numberToHex( $value:int, $length:int=6 ):String{
			var str: String = $value.toString( 16 ).toUpperCase();
			var len: int = $length - str.length;
			var i:int = -1;
			while( ++i<len ){
				str = "0" + str;
			}
			return "0x" + str;
		}
		
		/**
		 * value값에 원하는 만큼의 0을 추가한다.
		 * num은 value값과 추가될 0의 길이를 합한 문자열 길이 
		 *  
		 * @param value:int
		 * @param num:int=2 value.length+(value.length-num);
		 * @return:String
		 */		
		
		public static function addZeros( $value:int, $num:int=2 ):String{
			var str: String = String( $value );			
			var len: int = $num - str.length;
			var i:int = 0;
			for( i; i<len; i++ ){
				str = "0" + str;	
			}
			return str;
		}
		
		/**
		 * Check String's spelling without space. 
		 * @param $string1:String
		 * @param $string2:String
		 * @return:Boolean
		 */		
		public static function compareStringTrimSpace( $string1:String, $string2:String ):Boolean{
			var i:int = 0;
			var s1:String = "";
			var s2:String = "";
			for( i; i<$string1.length; ++i ){
				if( $string1.charAt(i) != " " && $string1.charAt(i) != "." ){
					s1 += $string1.charAt(i);
				}
			}
			for( i=0; i<$string2.length; ++i ){
				if( $string2.charAt(i) != " " && $string2.charAt(i) != "." ){
					s2 += $string2.charAt(i);
				}
			}
			return ( s1 == s2 );
		}
		
		/**
		 * Compares two Strings then returns number of same chracters.
		 * @param string1:String
		 * @param string2:String
		 * @return:int 
		 */		
		public static function strcmp( $string1:String, $string2:String ):int{
			var count:int = 0;
			var i:int = 0;
			for( i; i < $string1.length ; ++i ){
				if( $string1.charAt(i) == $string2.charAt(i) ){ count ++; };
			}
			return count;
		}
		/**
		 * Compares two Strings then returns an integral value indicating the relationship between the strings.
		 * If they are equal to each other, it returns 1.
		 * @param string1:String
		 * @param string2:String
		 * @return:Number 			0 ~ 1
		 * 
		 */		
		public static function strcmpPercent( $string1:String, $string2:String ):Number{
			var count:int = 0;
			var len:int;
			var max:int;
			
			if( $string1.length < $string2.length ){
				len = $string1.length;
				max = $string2.length;
			}else{
				max = $string1.length;
				len = $string2.length;
			}
			
			var i:int = 0;
			for( i; i < len ; ++i ){
				if( $string1.charAt(i) == $string2.charAt(i) ){ count ++; };
			}
			return (count/max);
		}
		
		/**
		 * Return String's byte size.
		 * @param str:String
		 * @param encode:String
		 * @return:String 
		 */		
		public static function getByteSize( $str:String, $encode:String="UTF-8" ):int{
			var tmp: ByteArray = new ByteArray();
			tmp.writeMultiByte( $str, $encode );
			var result:int = tmp.length;
			return result;
		}
		
		public static function datetimeFormat( $time:Number ):String {
			var date:Date = new Date();
			date.time = $time*1000;
			return date.fullYear+"-"+addZeros(date.month+1)+"-"+addZeros(date.date)+" "+
				addZeros(date.hours)+":"+addZeros(date.minutes)+":"+addZeros(date.seconds);
		}
		
		/**
		 * @param $seconds:int 	9925
		 * @return:String 		02:45:25
		 */		
		public static function timeFormatColonHourMinSec( $seconds:int ):String {
			var hour:int = $seconds/3600;
			var min:int = ($seconds/60)%60;
			var sec:int = $seconds%60;
			return addZeros( hour )+":"+addZeros( min )+":"+addZeros( sec );
		}
		
		/**
		 * 
		 * @param $ms:int 	9925000
		 * @return:String 	02:45:25
		 * 
		 */		
		public static function timeFormatColonHourMinSecUsingMS( $ms:int ):String {
			var hour:int = $ms/3600000;
			var min:int = ($ms/60000)%60;
			var sec:int = ($ms/1000)%60;
			return addZeros( hour )+":"+addZeros( min )+":"+addZeros( sec );
		}
		
		/**
		 * @param $seconds:int 		9900
		 * @return:String			45:00 not 02:45:00
		 */		
		public static function timeFormatColonMinSec( $seconds:int ):String{
			var min:int = ($seconds/60)%60;
			var sec:int = $seconds%60;
			return addZeros( min )+":"+addZeros( sec );
		}
		
		/**
		 * @param $ms:int 	9900000
		 * @return:String 	45:00 not 02:45:00
		 */		
		public static function timeFormatColonMinSecUsingMS( $ms:int ):String{
			var min:int = ($ms/60000)%60;
			var sec:int = ($ms/1000)%60;
			return addZeros( min )+":"+addZeros( sec );
		}
		
		public static function parsingText( $text:String="", $valObject:Object=null ):String{
			var str:String = $text;
			try {
				if ( $valObject != null ) {
					var i:String;
					for ( i in $valObject ) {
						str = str.replace( "|" + i + "|", $valObject[i] );
					}
				}
			}catch ( e:Error ) {
				trace( "StringUtil Error!! - " + e.name + " : " + e.message );
			}
			return str;
		}
		
		public static function makeNumberToOrdinal( $order:int ):String{
			switch( $order ){
				case 1 :
					return "first";
				case 2 :
					return "second";
				case 3 :
					return "third";
				case 11 :
					return "eleven";
				case 12 :
					return "twelfth";
				default :
					return null;
			}
			return null;
		}
		
		public static function makePlural( $str:String ):String{
			var _vowels:String = "aeiouAEIOU";
			if (($str.substr(-2) == "ff") || ($str.substr(-2) == "fe")) {
				return $str.substr(0, -2) + "ves";
			}else if($str.substr(-1) == "s") {
				return $str + "es";
			}else if(( $str.substr(-1) == "y" ) && (_vowels.indexOf($str.substr(-2, 1)) == -1 )) {
				return $str.substr(0, -1) + "ies";
			}else{
				return $str + "s";
			}
		}
		
		public static function makeSingular( $str:String ):String{
			var vowels:String = "aeiouAEIOU";
			if ( vowels.indexOf($str.substr(0, 1)) == -1 ) return "a " + $str;
			else return "an " + $str;
		}
	}
}