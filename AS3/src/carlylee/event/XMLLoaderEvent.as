package carlylee.event
{
	import flash.events.Event;
	/**
	 * XMLLoaderEvent
	 * 
	 * @author Eunjeong, Lee.
	 * modified: Mar 28, 2014
	 */	
	public class XMLLoaderEvent extends Event
	{
		public static const LOAD_COMPLETE: String = "loadComplete";
		public static const LOAD_ERROR:String = "loadError";
		
		public var xml: XML;
		public var error:String;
		
		public function XMLLoaderEvent( type:String, xml:XML, error:String="", bubbles:Boolean=false, cancelable:Boolean=false )
		{
			super(type, bubbles, cancelable);
			this.xml = xml;
			this.error = error;
		}
		
		public override function clone():Event{
			return new XMLLoaderEvent( type, xml, error, bubbles, cancelable );
		}
		
		public override function toString():String{
			return formatToString( "XMLLoaderEvent", "type", "xml", "error", "bubbles", "cancelable", "eventPhase" );
		}
		
	}
}
