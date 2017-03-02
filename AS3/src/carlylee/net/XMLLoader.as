package carlylee.net
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.utils.ByteArray;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	
	import carlylee.event.XMLLoaderEvent;
	import carlylee.util.XMLUtil;

	/**
	 * XMLLoader
	 *
	 * How to use : 
	 * var xmlLoader:XMLLoader = new XMLLoader();
	 * 
	 * xmlLoader.init( "test.xml" );
	 * xmlLoader.addEventListener( XMLLoaderEvent.LOAD_COMPLETE, onXMLLoadComplete );
	 * xmlLoader.addEventListener( XMLLoaderEvent.LOAD_ERROR, onXMLLoaderError );
	 * or
	 * xmlLoader.init( "test.xml", completeFunc, errorFunc );
	 * 
	 * xmlLoader.load();
	 * 
	 * onXMLLoadComplete( $e:XMLLoaderEvent );
	 * onXMLLoaderError( $error:String );
	 * 
	 * completeFunc( $xml:XML );
	 * errorFunc( $error:String );
	 * 
	 * author: Eunjeong, Lee(carly.l86@gmail.com).
	 * created: Dec 10, 2013
	 * modified: Mar 28, 2014
	 */
	public class XMLLoader extends EventDispatcher
	{
		public static const RETRY_DELAY:int = 1000;
		public static var ROOT_XML_NAME:String;
		
		private var _urlLoader:URLLoader;
		private var _urlRequest:URLRequest;
		private var _urlVar:URLVariables;
		private var _tryNumber:int;
		private var _maxTryNumber:int = 3;
		private var _isZipped:Boolean = false;
		private var _startTime:int;
		private var _lastTime:int;
		private var _charSet:String;
		
		public var xml:XML;
		public var error:String;
		public var completeFunc:Function;
		public var errorFunc:Function;
		public var progressFunc:Function;
		public var data:Object;
		
		/**
		 * You must call 'init()' before using this. 
		 */		
		public function XMLLoader(){}	
		
		/**
		 * You must call this function before call 'load()'.
		 * @param $url:String
		 * @param $isPost:Boolean URLRequestMethod.POS : URLRequestMethod.GET
		 * @param $urlVar:URLVariables
		 * @param $isZipped:Boolean
		 * @param $maxTryNumber:int=3
		 * 
		 */		
		public function init( $url:String, 
							  $completeFunc:Function,
							  $errorFunc:Function,
							  $urlVar:URLVariables=null, 
							  $progressFunc:Function=null,
							  $urlMethod:String=URLRequestMethod.GET, 
							  $isZipped:Boolean=false, 
							  $maxTryNumber:int=3 ):void{
			
			if( $urlVar == null ){
				this._urlVar = new URLVariables;
			}else{
				this._urlVar = $urlVar;
			}
			
			this._isZipped = $isZipped;
			this._maxTryNumber = $maxTryNumber;
			this._urlRequest = new URLRequest( $url );
			this._urlRequest.method = $urlMethod;
			this.completeFunc = $completeFunc;
			this.errorFunc = $errorFunc;
			this.progressFunc = $progressFunc;
			
			_urlLoader = new URLLoader;
			_urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
			_urlLoader.addEventListener( Event.COMPLETE, onComplete );
			_urlLoader.addEventListener( ProgressEvent.PROGRESS, onProgress );
			_urlLoader.addEventListener( IOErrorEvent.IO_ERROR, onIOError );
			_urlLoader.addEventListener( HTTPStatusEvent.HTTP_STATUS, onHTTPStatus );
		}
		
		private function onProgress( $e: ProgressEvent ):void {
			if ( this.progressFunc == null ) {
				dispatchEvent( $e.clone() );
			}else {
				this.progressFunc( $e );
			}			
		}
		
		private function onHTTPStatus( $e:HTTPStatusEvent ):void {
			if ( $e.status != 200) trace("onHTTPStatus: ", $e.toString());
		}
		
		/**
		 * You can choose 'Character Set' what you want.
		 * @param $charSet:String=UTF-8
		 * http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/charset-codes.html
		 */		
		public function load( $charSet:String="UTF-8", $random:Boolean=false ):void{
			_charSet = $charSet;
			_startTime = getTimer();
			if( $random ){
				if( _lastTime >= _startTime ) _startTime = _lastTime+1;
				_urlVar.avmTime = String( _startTime );
				_urlVar.random = String( Math.random() );
			}
			_tryNumber ++;
			_urlRequest.data = _urlVar;
			_urlLoader.load( _urlRequest );
		}
		
		private function onComplete( $e:Event ):void{
			_urlLoader.removeEventListener( Event.COMPLETE, onComplete );
			_urlLoader.removeEventListener( ProgressEvent.PROGRESS, onProgress );
			_urlLoader.removeEventListener( IOErrorEvent.IO_ERROR, onIOError );
			_urlLoader.removeEventListener( HTTPStatusEvent.HTTP_STATUS, onHTTPStatus );
			_urlLoader.close();
			
			var str:String;
			var byteArray:ByteArray = ByteArray( _urlLoader.data );
			if( _isZipped ){
				if( byteArray.length>0 ){
					try{
						byteArray.uncompress();
						str = byteArray.readMultiByte( byteArray.length, _charSet );
						if( ROOT_XML_NAME != null ) XMLUtil.trimXMLString( str, ROOT_XML_NAME );
						this.xml = new XML( str );
					}catch( $e:Error ){
						this.loadCompleteError( $e, str );
						return;
					}
				}else{
					this.error = "XMLLoader has received nothing.";
					trace( error );
					this.onIOError( null );
					return;
				}
			}else{
				if( byteArray.length > 0 ){
					try{
						str = byteArray.readMultiByte( byteArray.length, _charSet );
						if( ROOT_XML_NAME != null ) XMLUtil.trimXMLString( str, ROOT_XML_NAME );
						this.xml = new XML( str );
					}catch( $e:Error ){
						this.loadCompleteError( $e, str );
						return;
					}
				}else{
					this.error = "XMLLoader has received nothing.";
					trace( error );
					this.onIOError( null );
					return;
				}
			}
			var elapsedTime:int = getTimer() - _startTime;
			trace( "XMLLoader loading XML data is succeed : " + _urlRequest.url );
			trace( "Elapsed Time: " + elapsedTime + "ms. Try number: " + _tryNumber );			
			if ( this.completeFunc == null ) {
				dispatchEvent( new XMLLoaderEvent( XMLLoaderEvent.LOAD_COMPLETE, xml, error ));
			}else {
				this.completeFunc( xml );
			}
		}
		
		private function loadCompleteError( $e:Error, $str:String ):void{
			_urlLoader.removeEventListener( Event.COMPLETE, onComplete );
			_urlLoader.removeEventListener( ProgressEvent.PROGRESS, onProgress );
			_urlLoader.removeEventListener( IOErrorEvent.IO_ERROR, onIOError );
			_urlLoader.removeEventListener( HTTPStatusEvent.HTTP_STATUS, onHTTPStatus );
			trace( "loadCompleteError -----------------------" );
			this.error = "XMLLoader.Error: " + $e.errorID + "/" + _urlRequest.url +"/Try number: " + _tryNumber + "\nXML: " + $str;
			trace( error );
			if( _tryNumber < _maxTryNumber ){
				this.reload();
			}else{
				if ( this.errorFunc == null ) {
					this.dispatchEvent( new XMLLoaderEvent( XMLLoaderEvent.LOAD_ERROR, null, this.error ));
				}else {
					this.errorFunc( this.error );
				}	
				_urlLoader = null;
			}
		}
		
		private function onIOError( $e:IOErrorEvent ):void{
			_urlLoader.removeEventListener( Event.COMPLETE, onComplete );
			_urlLoader.removeEventListener( ProgressEvent.PROGRESS, onProgress );
			_urlLoader.removeEventListener( IOErrorEvent.IO_ERROR, onIOError );
			_urlLoader.removeEventListener( HTTPStatusEvent.HTTP_STATUS, onHTTPStatus );
			trace( "XMLLoader load failed. /" + _urlRequest.url + "/Try number: " + _tryNumber );
			var elapsedTime:int = getTimer() - _startTime;
			if( _tryNumber < _maxTryNumber ){
				this.reload();
			}else{
				trace( "XMLloader reloading XML is failed." );
				this.error = "XMLLoader load failed / " + _urlRequest.url +"/ Try number: " +_tryNumber; 
				if ( this.errorFunc == null ) {
					this.dispatchEvent( new XMLLoaderEvent( XMLLoaderEvent.LOAD_ERROR, null, this.error ));
				}else {
					this.errorFunc( this.error );
				}
				_urlLoader = null;
			}
		} 
		
		private function reload():void{
			_urlLoader = null;
			_urlLoader = new URLLoader;
			_urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
			_urlLoader.addEventListener( Event.COMPLETE, onComplete );
			_urlLoader.addEventListener( ProgressEvent.PROGRESS, onProgress );
			_urlLoader.addEventListener( IOErrorEvent.IO_ERROR, onIOError );
			_urlLoader.addEventListener( HTTPStatusEvent.HTTP_STATUS, onHTTPStatus );
			trace( "XMLLoader try to reload XML." );
			setTimeout( load, RETRY_DELAY );
		}
	}
}