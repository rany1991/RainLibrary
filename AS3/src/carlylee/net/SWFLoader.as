package carlylee.net
{
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.system.SecurityDomain;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	
	import carlylee.event.SWFLoaderEvent;
	
	/**
	 * SWFLoader
	 * 
	 * How to use :
	 * var swfLoader:SWFLoader = new SWFLoader( "swfFileName.swf", completeFunc, errorFunc );
	 * 
	 * swfLoader.addEventListener( SWFLoaderEvent.LOAD_COMPLETE, onSwfLoadComplete );
	 * swfLoader.addEventListener( IOErrorEvent.IO_ERROR, onSwfLoadError );
	 * swfLoader.load();
	 * 
	 * onSwfLoadComplete( $e:SWFLoaderEvent );
	 * onSwfLoadError( $error:String );
	 * 
	 * var swfLoader:SWFLoader = new SWFLoader( "swfFileName.swf" );
	 * completeFunc( $loader:SWFLoader );
	 * errorFunc( $error:String );
	 * 
	 * var loader:SWFLoader = $loader or $e.loader;
	 * var class:Class = loader.getClass( className );
	 * var obj:Object = new class(); 
	 * And you can use the method of 'class', like 'obj.classInfo();'.
	 * 
	 * Or you can use Dictionary.
	 * _dict[ className ] = loader.getClass( className );
	 * new _dict[ className ];
	 * 
	 * If you have specific type of Class, you have to use 'as';
	 * loader.getClass( className ) as 'specific type'.
	 * 
	 * author: Eunjeong, Lee(carly.l86@gmail.com).
	 * created: Dec 16, 2013
	 * modified: Mar 28, 2014
	 */
	
	public class SWFLoader extends EventDispatcher
	{
		public static const RETRY_DELAY:int = 1000;
		
		private var _loader:Loader;
		private var _urlRequest:URLRequest;
		private var _urlVar:URLVariables;
		private var _tryNumber:int = 0;
		private var _maxTryNumber:int = 3;
		private var _startTime:int;
		
		public var error:String;
		public var initFunc:Function;
		public var completeFunc:Function;
		public var errorFunc:Function;
		public var progressFunc:Function;
		public var data:Object;
		public var swf:DisplayObject;
		public var applicationDomain:ApplicationDomain;
		public var loaderContext:LoaderContext;
		
		/**
		 * 
		 * @param $url:String
		 * @param $completeFunc:Function
		 * @param $errorFunc:Function
		 * @param $urlVar:URLVariables=null
		 * @param $progressFunc:Function=null
		 * @param $maxTryNumber:int=3
		 * @param $initFunc:Function=null
		 * 
		 */		
		public function SWFLoader( $url:String,
							  $completeFunc:Function=null,
							  $errorFunc:Function=null,
							  $urlVar:URLVariables=null,
							  $progressFunc:Function=null,
							  $estimatedBytes:int=100,
							  $maxTryNumber:int=3,
							  $initFunc:Function=null ):void{
			
			if( $urlVar == null ){
				this._urlVar = new URLVariables;
			}else{
				this._urlVar = $urlVar;
			}
			
			this._maxTryNumber = $maxTryNumber;
			this._urlRequest = new URLRequest( $url );
			this.completeFunc = $completeFunc;
			this.errorFunc = $errorFunc;
			this.progressFunc = $progressFunc;
			this.initFunc = $initFunc;
			
			_loader = new Loader;
			_loader.contentLoaderInfo.addEventListener( Event.COMPLETE, onComplete );
			_loader.contentLoaderInfo.addEventListener( ProgressEvent.PROGRESS, onProgress, false, 0, true );
			_loader.contentLoaderInfo.addEventListener( Event.INIT, onInit, false, 0, true );
			_loader.contentLoaderInfo.addEventListener( IOErrorEvent.IO_ERROR, onIOError, false, 0, true );
		}
		
		/**
		 * @param $random:Boolean=false 	if it's true 'url?545465', it's not true 'url'.
		 */		
		public function load( $random:Boolean=false ):void{
			_startTime = getTimer();
			if( $random ){
				_urlRequest.url = _urlRequest.url + "?" + Math.random();
			}
			_tryNumber ++;
			if( loaderContext == null ){
				loaderContext = new LoaderContext();
				loaderContext.applicationDomain = ApplicationDomain.currentDomain;
				loaderContext.securityDomain = SecurityDomain.currentDomain;
				loaderContext.checkPolicyFile = true;
			}
			_urlRequest.data = _urlVar;
			_loader.load( this._urlRequest, loaderContext );
		}
		
		/**
		 * If you want to get 'bytesTotal', you need to disable 'GZIP' for swfs on your server.
		 * Add this to your .htaccess file : SetEnvIfNoCase          Request_URI \.swf$ no-gzip dont-vary
		 * @param $e
		 */		
		private function onProgress( $e:ProgressEvent ):void{
			if ( this.progressFunc == null ) {
				dispatchEvent( $e );
			}else {
				this.progressFunc( $e );
			}
		}
		
		private function onInit( $e:Event ):void{
			_loader.contentLoaderInfo.removeEventListener( Event.INIT, onInit );
			if( this.initFunc == null ){
				this.dispatchEvent( $e.clone() );
			}else{
				this.initFunc( $e );
			}
		}
		
		private function onComplete( $e:Event ): void{
			_loader.contentLoaderInfo.removeEventListener( Event.COMPLETE, onComplete );
			_loader.contentLoaderInfo.removeEventListener( ProgressEvent.PROGRESS, onProgress );
			_loader.contentLoaderInfo.removeEventListener( IOErrorEvent.IO_ERROR, onIOError );
			var elapsedTime:int = getTimer() - _startTime;
			trace( "[SWFLoader] " + _urlRequest.url + "is successfully loaded. " + elapsedTime + "ms were elapsed. " + _tryNumber + " times tried." );
			this.swf = _loader.content;
			this.applicationDomain = swf.loaderInfo.applicationDomain;
			
			if( this.completeFunc == null ){
				this.dispatchEvent( new SWFLoaderEvent( SWFLoaderEvent.LOAD_COMPLETE, this ));	
			}else{
				this.completeFunc( this );
			}
		}
		
		/**
		 * @param className(String)
		 * @return *
		 */		
		public function getClass( className:String ):*{
			try {
				return applicationDomain.getDefinition( className );
			} catch ( $e:Error) {
				throw new IllegalOperationError( className + " definition is not found in " + swf );
			}
			return null;
		}
		
		private function onIOError( $e:IOErrorEvent ):void{
			_loader.contentLoaderInfo.removeEventListener( Event.INIT, onInit );
			_loader.contentLoaderInfo.removeEventListener( Event.COMPLETE, onComplete );
			_loader.contentLoaderInfo.removeEventListener( ProgressEvent.PROGRESS, onProgress );
			_loader.contentLoaderInfo.removeEventListener( IOErrorEvent.IO_ERROR, onIOError );
			trace( "[SWFLoader] IOError: " + _urlRequest.url );
			if( _tryNumber < _maxTryNumber ){
				this.reload();
			}else{
				if( this.errorFunc == null ){
					this.dispatchEvent( $e.clone() );
				}else{
					this.error = $e.toString();
					this.errorFunc( this.error );
				}
				this.unload();
			}
		}
		
		private function reload():void{
			_loader = new Loader;
			_loader.contentLoaderInfo.addEventListener( Event.COMPLETE, onComplete );
			_loader.contentLoaderInfo.addEventListener( ProgressEvent.PROGRESS, onProgress, false, 0, true );
			_loader.contentLoaderInfo.addEventListener( Event.INIT, onInit, false, 0, true );
			_loader.contentLoaderInfo.addEventListener( IOErrorEvent.IO_ERROR, onIOError, false, 0, true );
			setTimeout( load, RETRY_DELAY );
		}
		
		public function unload():void{
			if( _loader == null ) return;
			swf = null;
			_loader.unloadAndStop();
			_loader = null;
		}
	}
}