package carlylee.event
{
	import flash.events.Event;
	import carlylee.net.SWFLoader;
	
	
	/**
	 * SWFLoaderEvent
	 * @ loader( SWFLoader )
	 * 
	 * author: Eunjeong, Lee(carly.l86@gmail.com).
	 * created: Dec 16, 2013
	 */
	
	public class SWFLoaderEvent extends Event
	{
		public static const LOAD_COMPLETE: String = "loadComplete";
		
		public var loader:SWFLoader;
		
		public function SWFLoaderEvent( type:String, loader:SWFLoader , bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.loader = loader;
		}
		
		public override function clone():Event{
			return new SWFLoaderEvent( type, loader, bubbles, cancelable );
		}
		
		public override function toString():String{
			return formatToString( "SWFLoaderEvent", "type", "loader", "bubbles", "cancelable", "eventPhase" );
		}
	}
}