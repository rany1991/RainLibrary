package org.easily.test.box2d
{
	import Box2D.Common.Math.*;
	import Box2D.Dynamics.*;
	
	import flash.display.*;
	import flash.events.Event;
	
	import org.easily.box2d.b2Utils;
	
	[SWF(width="640", height="480", backgroundColor="0x414647")]
	public class Box2dTest3 extends Sprite
	{
		private var world:b2World;
		private var walker:JansenWalker;
		
		public function Box2dTest3()
		{
			super();
			
			var sleep:Boolean = true;
			var gravity:b2Vec2 = new b2Vec2(0, 9.81);
			world = new b2World(gravity, sleep);
			
			createWalker();
			b2Utils.createWall(world, 640, 480, 5, 2, 0.3, 0.5);
			b2Utils.mouseJoint(stage, world);
			b2Utils.createDebug(this, world, b2DebugDraw.e_jointBit | b2DebugDraw.e_shapeBit, 0.5);
			
			addEventListener(Event.ENTER_FRAME, onUpdate);
		}
		
		private function createWalker():void
		{
			walker = new JansenWalker(world);
			walker.setPosition(new b2Vec2(150, 350));
		}
		
		private function onUpdate(event:Event):void
		{
			world.Step(b2Utils.timeStep, b2Utils.velIterations, b2Utils.posIterations);
			world.ClearForces();
			world.DrawDebugData();
		}
	}
}