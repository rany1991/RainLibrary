package carlylee.net
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	
	import carlylee.event.ImageLoaderEvent;

	/**
	 * ImageLoader
	 * 
	 * How to use :
	 * var imgLoader:ImageLoader = new ImageLoader( "img.jpg", completeFunc, errorFunc );
	 * imgLoader.addEventListener( ImageLoaderEvent.LOAD_COMPLETE, onImageLoadComplete );
	 * imgLoader.addEventListener( IOErrorEvent.IO_ERROR, onImageLoadError );
	 * imgLoader.load();
	 * 
	 * onImageLoadComplete( $e:ImageLoaderEvent );
	 * onImageLoadError( $error:String );
	 * 
	 * completeFunc( $loader:ImageLoader );
	 * errorFunc( $error:String );
	 * 
	 * @author Eunjeong, Lee(carly.l86@gmail.com).
	 * modified: Mar 28, 2014
	 */
	public class ImageLoader extends EventDispatcher
	{
		public static const RETRY_DELAY:int = 1000;
		
		private var _loader:Loader;
		private var _urlRequest:URLRequest;
		private var _tryNumber:int = 0;
		private var _maxTryNumber:int = 3;
		private var _startTime:int;
		
		public var smoothing:Boolean = false;
		public var error:String;
		public var initFunc:Function;
		public var completeFunc:Function;
		public var errorFunc:Function;
		public var progressFunc:Function;
		public var data:Object;
		public var displayObject:DisplayObject;
		public var bitmap:Bitmap;
		public var loaderContext:LoaderContext;
		
		/**
		 * @param $url:String
		 * @param $completeFunc:Function
		 * @param $errorFunc:Function
		 * @param $progressFunc:Function=null
		 * @param $maxTryNumber:int=3
		 * @param $smoothing:Boolean=false
		 * @param $initFunc:Function=null
		 * 
		 */		
		public function ImageLoader( $url:String,
							  $completeFunc:Function=null,
							  $errorFunc:Function=null,
							  $progressFunc:Function=null,
							  $maxTryNumber:int=3,
							  $smoothing:Boolean=false,
							  $initFunc:Function=null ):void{
			
			this._maxTryNumber = $maxTryNumber;
			this.completeFunc = $completeFunc;
			this.errorFunc = $errorFunc;
			this.progressFunc = $progressFunc;
			this.smoothing = $smoothing;
			this.initFunc = $initFunc;
			this._urlRequest = new URLRequest( $url );
			
			_loader = new Loader;
			_loader.contentLoaderInfo.addEventListener( Event.COMPLETE, onComplete );
			_loader.contentLoaderInfo.addEventListener( ProgressEvent.PROGRESS, onProgress, false, 0, true );
			_loader.contentLoaderInfo.addEventListener( Event.INIT, onInit, false, 0, true );
			_loader.contentLoaderInfo.addEventListener( IOErrorEvent.IO_ERROR, onIOError, false, 0, true );
		}
		
		/**
		 * @param $random:Boolean=false	 if it's true 'url?545465', it's not true 'url'.
		 */		
		public function load( $random:Boolean=false, $noContext:Boolean=false ):void{
			if( _loader==null ) return;
			_startTime = getTimer();
			if( $random ){
				_urlRequest.url = _urlRequest.url + "?" + Math.random();
			}
			_tryNumber ++;
			if( !$noContext ){
				loaderContext= new LoaderContext();
				loaderContext.checkPolicyFile = true;
			}
			_loader.load( this._urlRequest, loaderContext );
		}
		
		private function onProgress( $e:ProgressEvent ):void{
			if ( this.progressFunc == null ) {
				dispatchEvent( $e.clone() );
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
			if( _loader==null ) return;
			_loader.contentLoaderInfo.removeEventListener( Event.COMPLETE, onComplete );
			_loader.contentLoaderInfo.removeEventListener( ProgressEvent.PROGRESS, onProgress );
			_loader.contentLoaderInfo.removeEventListener( IOErrorEvent.IO_ERROR, onIOError );
			var elapsedTime:int = getTimer() - _startTime;
//			trace( "[ImageLoader] " + _urlRequest.url + "is successfully loaded. " + elapsedTime + "ms were elapsed. " + _tryNumber + " times tried." );	
			try{
				this.bitmap = $e.target.content;
				if( smoothing ) bitmap.smoothing = true;
			}catch($e:Error){
				trace( $e.name + " : " + $e.message );
				trace( $e.getStackTrace() );
			}
			this.displayObject = _loader;
			if( this.completeFunc == null ){
				this.dispatchEvent( new ImageLoaderEvent( ImageLoaderEvent.LOAD_COMPLETE, displayObject, this.data ));	
			}else{
				this.completeFunc( this );
			}
		}
		
		private function onIOError( $e:IOErrorEvent ):void{
			if( _loader==null ) return;
			_loader.contentLoaderInfo.removeEventListener( Event.INIT, onInit );
			_loader.contentLoaderInfo.removeEventListener( Event.COMPLETE, onComplete );
			_loader.contentLoaderInfo.removeEventListener( ProgressEvent.PROGRESS, onProgress );
			_loader.contentLoaderInfo.removeEventListener( IOErrorEvent.IO_ERROR, onIOError );
//			trace( "[ImageLoader] IOError: " + _urlRequest.url );
			if( _tryNumber < _maxTryNumber ){
				this.reload();
			}else{
				if( this.errorFunc == null ){
					this.dispatchEvent( $e );
				}else{
					this.error = $e.toString();
					this.errorFunc( this.error );
				}
			}
		}
		
		private function reload():void{
			_loader.contentLoaderInfo.addEventListener( Event.COMPLETE, onComplete );
			_loader.contentLoaderInfo.addEventListener( ProgressEvent.PROGRESS, onProgress, false, 0, true );
			_loader.contentLoaderInfo.addEventListener( Event.INIT, onInit, false, 0, true );
			_loader.contentLoaderInfo.addEventListener( IOErrorEvent.IO_ERROR, onIOError, false, 0, true );
			setTimeout( load, RETRY_DELAY );
		}
		
		public function unload( $gc:Boolean=true ):void{
			if( _loader == null ) return;
			displayObject = null;
			_loader.unloadAndStop( $gc );
			_loader = null;
			loaderContext = null;
		}
	}
}
