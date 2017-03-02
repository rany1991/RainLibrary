package org.easily.test
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	dynamic public class DispatcherEx extends EventDispatcher
	{
		public function DispatcherEx(target:IEventDispatcher=null)
		{
			super(target);
		}
	}
}