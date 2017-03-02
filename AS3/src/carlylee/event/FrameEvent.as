package carlylee.event
{
	import flash.events.Event;
	
	
	/**
	 * FrameEvent
	 *
	 * author: Eunjeong, Lee.
	 * created: Dec 10, 2013
	 */
	
	public class FrameEvent extends Event
	{
		public static const FRAME_START:String = "frameStart";
		public static const FRAME_ENDED:String = "frameEnded";
		
		public var frameLabel:String = "";
		public var frameIndex:int = 0;
		
		public function FrameEvent(type:String, frameLabel:String="", frameIndex:int=0, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.frameLabel = frameLabel;
			this.frameIndex = frameIndex;
		}
		
		public override function clone():Event{
			return new FrameEvent( type, frameLabel, frameIndex, bubbles, cancelable );
		}
		
		public override function toString():String{
			return formatToString( "FrameEvent", "type", "frameLabel", "frameIndex", "bubbles", "cancelable", "eventPhase" );
		}
	}
}