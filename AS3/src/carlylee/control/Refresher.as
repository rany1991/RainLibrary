package carlylee.control
{
	import flash.utils.Dictionary;
	
	/**
	 * Refresher
	 * It manages several RefreshItems with key value using 'Dictionary'.
	 * The 'Dictionary' has Vectors type of <RefreshItem>.
	 * You can add RefreshItems and use 'executeRefresh', so you can update information, status.. the other things.
	 * 
	 * author: Eunjeong, Lee(carly.l86@gmail.com).
	 * created: Dec 12, 2013
	 */
	public class Refresher
	{
		private static var _dict:Dictionary = new Dictionary();//contains of Vector.<RefreshItem>
		public static var strictMode:Boolean = true;
		
		public static function addRefreshItem( $refreshItem:RefreshItem ):void{
			if( _dict[$refreshItem.group] == undefined ){
				_dict[$refreshItem.group] = new Vector.<RefreshItem>;
			}
			_dict[$refreshItem.group].push( $refreshItem );
		}
		
		public static function executeRefresh( $groupName:String, ...$params ):void{
			if( _dict[$groupName] == undefined ){
				var errorMessage:String = "There is no group called [" + $groupName + "] in Refresher.";
				trace( errorMessage );
				if( strictMode ) throw new Error( errorMessage );
			}else{
				var v:Vector.<RefreshItem> = _dict[$groupName];
				var i:int = 0;
				for( i; i<v.length; ++i ){
					v[i].func.apply( v[i].thisObject, $params );
				}
			}
		}
		
		public static function getGroup( $groupName:String ):Vector.<RefreshItem>{
			return _dict[$groupName];
		}
		
		public static function deleteRefreshGroup( $groupName:String ):void{
			if( _dict[$groupName] == undefined ){
				var errorMessage:String = "There is no group called [" + $groupName + "] in Refresher.";
				trace( errorMessage );
				if( strictMode ) throw new Error( errorMessage );
			}else{
				delete _dict[$groupName];
			}
		}
		
		public static function deleteRefreshItem( $refreshItem:RefreshItem ):void{
			if( _dict[$refreshItem.group] == undefined ){
				var errorMessage:String = "There is no group called [" + $refreshItem.group + "] in Refresher.";
				trace( errorMessage );
				if( strictMode ) throw new Error( errorMessage );
			}else{
				var v:Vector.<RefreshItem> = _dict[$refreshItem.group];
				var i:int = 0;
				for( i; i<v.length; ++i ){
					if( v[i] == $refreshItem ){
						v[i] = null;
						break;
					}
				}
				v = v.filter( deleteNull, Refresher );
				if( v.length < 1 ){
					delete _dict[$refreshItem.group];
				}else{
					_dict[$refreshItem.group] = v;
				}
			}
		}
		
		public static function deleteRefreshItemWithID( $groupName:String, $id:String ):void{
			if( _dict[$groupName] == undefined ){
				var errorMessage:String = "There is no group called [" + $groupName + "] in Refresher.";
				trace( errorMessage );
				if( strictMode ) throw new Error( errorMessage );
			}else{
				var v:Vector.<RefreshItem> = _dict[$groupName];
				var i:int = 0;
				for( i; i<v.length; ++i ){
					if( v[i].id == $id ){
						v[i] = null;
						break;
					}
				}
				v = v.filter( deleteNull, Refresher );
				if( v.length < 1 ){
					delete _dict[$groupName];
				}else{
					_dict[$groupName] = v;
				}
			}
		}
		
		public static function deleteNull( $item:*, $index:int, $vector:Vector.<*> ):Boolean{
			var b:Boolean = false;
			if( $item != null ) b = true;
			return b;
		}
	}
}