package carlylee.util
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import carlylee.event.FrameEvent;
	
	/**
	 * MovieClipUtil
	 *
	 * author: Eunjeong, Lee.(carly.l86@gmail.com).
	 * created: Dec 10, 2013
	 */
	
	public class MovieClipUtil
	{
		/**
		 * @param $mc:MovieClip
		 * @param $reset:Boolean 	if 'true', brings the playhead to the first frame of the MovieClip and stops it there.
		 */
		public static function freezeMovieClip( $mc:MovieClip, $reset:Boolean=false ):void{
			if( $mc==null ) return;
			var i:int = $mc.numChildren;
			if( $reset ) $mc.gotoAndStop( 1 );
			else $mc.stop();
			while( --i>-1 ){
				freezeMovieClip( $mc.getChildAt(i), $reset );
			}
		}
		
		/**
		 * @param $mc
		 * @param $fromFirstFrame	if 'true', brings the playhead to the first frame of the MovieClip and play from there.
		 */			
		public static function unfreezeMovieClip( $mc:MovieClip, $fromFirstFrame:Boolean=false ):void{
			if( $mc==null ) return;
			var i:int = $mc.numChildren;
			if( $fromFirstFrame ) $mc.gotoAndPlay( 1 );
			else $mc.play();
			while( --i>-1 ){
				unfreezeMovieClip( $mc.getChildAt(i), $fromFirstFrame );
			}
		}
		
		/**
		 * Only plays MovieClip to NextFrame.
		 * When start playing MovieClip, you'll get an 'FrameEvent.FRAME_START' Event.
		 * When playing MovieClip is done, you'll get an 'FrameEvent.FRAME_ENDED' Event.
		 * @param $mc:MovieClip
		 * 
		 */		
		public static function playNextFrame( $mc:MovieClip ):void{
			$mc.addEventListener( Event.ENTER_FRAME, onNextEnter );
			$mc.dispatchEvent( new FrameEvent( FrameEvent.FRAME_START ));
		}
		
		private static function onNextEnter( $e:Event ):void{
			var mc:MovieClip = $e.currentTarget as MovieClip;
			if( mc.currentFrame < mc.totalFrames ){
				mc.nextFrame();
			}else{
				mc.removeEventListener( Event.ENTER_FRAME, onNextEnter );
				mc.dispatchEvent( new FrameEvent( FrameEvent.FRAME_ENDED ));
			}
		}
		
		/**
		 * Only plays MovieClip to PrevFrame.
		 * When start playing MovieClip, you'll get an 'FrameEvent.FRAME_START' Event.
		 * When playing MovieClip is done, you'll get an 'FrameEvent.FRAME_ENDED' Event.
		 * @param $mc:MovieClip
		 * 
		 */		
		public static function playPrevFrame( $mc:MovieClip ):void{
			$mc.addEventListener( Event.ENTER_FRAME, onPrevEnter );
			$mc.dispatchEvent( new FrameEvent( FrameEvent.FRAME_START ));
		}
		
		private static function onPrevEnter( $e:Event ):void{
			var mc:MovieClip = $e.currentTarget as MovieClip;
			if( mc.currentFrame > 1 ){
				mc.prevFrame();
			}else{
				mc.removeEventListener( Event.ENTER_FRAME, onPrevEnter );
				mc.dispatchEvent( new FrameEvent( FrameEvent.FRAME_ENDED ));
			}
		}
	}
}