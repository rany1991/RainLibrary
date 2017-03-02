package org.easily.display
{
	import flash.events.Event;

	/**
	 * @author Easily
	 */
	public class Render extends Container
	{
		public function Render()
		{
			super();

			addEventListener(Event.ENTER_FRAME, onUpdate);
		}

		protected function onUpdate(event:Event):void
		{

		}

		override public function dispose():void
		{
			// TODO Auto Generated method stub
			removeEventListener(Event.ENTER_FRAME, onUpdate);

			super.dispose();
		}
	}
}
