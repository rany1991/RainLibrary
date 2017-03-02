package carlylee.event
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	/**
	 * ImageLoaderEvent
	 * 
	 * @author Eunjeong, Lee.
	 * modified: Mar 28, 2014
	 */
	public class ImageLoaderEvent extends Event
	{
		public static const LOAD_COMPLETE: String = "loadComplete";
		
		public var displayObject: DisplayObject;
		public var data:Object;
		
		public function ImageLoaderEvent( type:String, displayObject:DisplayObject, data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.displayObject = displayObject;
			this.data = data;
		}
		
		public override function clone():Event{
			return new ImageLoaderEvent( type, displayObject, data, bubbles, cancelable );
		}
		
		public override function toString():String{
			return formatToString( "ImageLoaderEvent", "type", "displayObject", "data", "bubbles", "cancelable", "eventPhase" );
		}
		
	}
}