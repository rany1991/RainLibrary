package carlylee.view.renderer
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	
	
	/**
	 * MovieClipRenderModel
	 *
	 * author: Eunjeong, Lee(carly.l86@gmail.com).
	 * created: Apr 21, 2014
	 */
	
	public class MovieClipRenderModel extends BitmapDataRenderModel
	{
		public var linkMovieClip:MovieClip;	//원본 무비클립.
		
		private var _isPlay:Boolean = true;
		private var _loop:Boolean = true;
		private var _frame:int = 0;	//current frame number
		private var _frames:Vector.<BitmapData> = new Vector.<BitmapData>;
		
		public function MovieClipRenderModel(){}
		
		/**
		 * @param $obj
		 * $obj.frames:Vector.<BitmapData>
		 * $obj.loop:Boolean = true;
		 * $obj.lastFrameEventDispatch:Boolean = false;
		 * $obj.mc:MovieClip - optional.
		 */	
		public override function init( $obj:Object ):void{
			_frames = $obj.frames;
			linkMovieClip = $obj.mc;
			if( $obj.loop == undefined ){
				_loop = true;
			}else{
				_loop = $obj.loop;
			}
			eventDispatch = $obj.lastFrameEventDispatch;
		}
		
		public function createBitmapData( $mc:MovieClip, $loop:Boolean=true, $lastFrameEventDispatch:Boolean=false ):void{
			_frames = BitmapDataConverter.fromMovieClip( $mc );
			linkMovieClip = $mc;
			_loop = $loop;
			eventDispatch = $lastFrameEventDispatch;
		}
		
		public function gotoAndStop( $frame:uint=0 ):void{
			_frame = $frame;
		}
		
		public function play( $loop:Boolean=true, $lastFrameEventDispatch:Boolean=false ):void{
			_isPlay = true;
			_loop = $loop;
			eventDispatch = $lastFrameEventDispatch;
		}
		
		public function stop():void{
			_isPlay = false;
		}
		
		internal override function getFrame():BitmapData{
			if( this._isPlay ){
				if( _frame < _frames.length-1 ){
					_frame ++;
				}else{
					if( this._loop ){
						_frame = 0;
					}else{
						this._isPlay = false;
						this.endCallback();
					}
				}
			}
			return _frames[_frame];
		}
		
		public override function destroy():void{
			var i:int = 0;
			for( i; i<_frames.length; ++i ){
				_frames[i].dispose();
			}
			linkMovieClip = null;
		}
	}
}