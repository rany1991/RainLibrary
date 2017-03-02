package org.easily.test
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import org.easily.test.shape.Arrow;
	
	public class ArrowTest extends Sprite
	{
		public function ArrowTest()
		{
			super();
				
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		private function onAddedToStage(event:Event):void
		{
			var arrow:Arrow = new Arrow;
			addChild(arrow);
			
			arrow.x = arrow.y = 300;
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			function onMouseMove(event:MouseEvent):void
			{
				var radian:Number = Math.atan2(event.localY - arrow.y, event.localX - arrow.x);
				arrow.rotation = radian * 180 / Math.PI;
			}
		}
	}
}