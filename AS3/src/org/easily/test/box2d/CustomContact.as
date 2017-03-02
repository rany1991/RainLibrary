package org.easily.test.box2d
{
	import Box2D.Dynamics.Contacts.b2Contact;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2ContactImpulse;
	import Box2D.Dynamics.b2ContactListener;
	import Box2D.Dynamics.b2Fixture;

	use namespace virtual;
	
	public class CustomContact extends b2ContactListener
	{
		public function CustomContact()
		{
			super();
		}

		override public function BeginContact(contact:b2Contact):void
		{
			//TODO Auto-generated method stub
//			var fixtureA:b2Fixture = contact.GetFixtureA();
//			var fixtureB:b2Fixture = contact.GetFixtureB();
//			var bodyA:b2Body = fixtureA.GetBody();
//			var bodyB:b2Body = fixtureB.GetBody();
//			trace("bodyA:"+bodyA.GetUserData()+"; bodyB:"+bodyB.GetUserData());
		}

		override public function EndContact(contact:b2Contact):void
		{
			//TODO Auto-generated method stub
		}

		override public function PostSolve(contact:b2Contact, impulse:b2ContactImpulse):void
		{
			//TODO Auto-generated method stub
			var fixtureA:b2Fixture = contact.GetFixtureA();
			var bodyA:b2Body = fixtureA.GetBody();
			
			var fixtureB:b2Fixture = contact.GetFixtureB();
			var bodyB:b2Body = fixtureB.GetBody();
		}
		
		public function checkBreak(body:b2Body):void
		{
			
		}
	}
}