package org.easily.test.box2d
{
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2World;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import org.easily.box2d.b2Utils;
	
	public class EasilyBox2D extends Sprite
	{
		protected var world:b2World;
		
		public function EasilyBox2D()
		{
			super();
			
			
			if (!stage)
			{
				addEventListener(Event.ADDED_TO_STAGE, createWorld);
			}
			else
			{
				createWorld(null);
			}
		}
		
		private function createWorld(event:Event):void
		{
			var sleep:Boolean = true;
			var gravity:b2Vec2 = new b2Vec2(0, 9.81);
			world = new b2World(gravity, sleep);
			
			b2Utils.createWall(world, stage.stageWidth, stage.stageHeight, 5, 2, 0.3, 0.5);
			b2Utils.mouseJoint(stage, world);
			b2Utils.createDebug(this, world, b2DebugDraw.e_jointBit | b2DebugDraw.e_shapeBit, 0.5);
			
			initShapes();
			
			addEventListener(Event.ENTER_FRAME, onUpdate);
		}
		
		protected function initShapes():void
		{
			
		}
		
		protected function onUpdate(event:Event):void
		{
			world.Step(b2Utils.timeStep, b2Utils.velIterations, b2Utils.posIterations);
			world.ClearForces();
			world.DrawDebugData();
		}
	}
}