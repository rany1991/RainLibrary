package org.easily.test.box2d
{
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2FilterData;
	
	import flash.display.Sprite;
	
	import org.easily.box2d.b2Utils;
	
	[SWF(width="640", height="480", backgroundColor="0x414647")]
	public class CollisionTest extends EasilyBox2D
	{
		public function CollisionTest()
		{
			super();
		}

		protected override function initShapes():void
		{
			//TODO Auto-generated method stub
			var circle:b2Body = b2Utils.createCircle(world, b2Body.b2_dynamicBody, new b2Vec2(100,100),50,20,0.3,0.4,-1);
			var rect:b2Body = b2Utils.createRect(world, b2Body.b2_dynamicBody, new b2Vec2(200,200),new b2Vec2(50,50),20,0.3,0.4,-2);
		}
	}
}