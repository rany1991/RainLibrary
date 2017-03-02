package org.easily.box2d 
{
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.Contacts.b2Contact;
	import Box2D.Dynamics.Contacts.b2ContactEdge;
	import Box2D.Dynamics.Joints.b2DistanceJoint;
	import Box2D.Dynamics.Joints.b2DistanceJointDef;
	import Box2D.Dynamics.Joints.b2MouseJoint;
	import Box2D.Dynamics.Joints.b2MouseJointDef;
	import Box2D.Dynamics.Joints.b2RevoluteJoint;
	import Box2D.Dynamics.Joints.b2RevoluteJointDef;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2Fixture;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * box2d utils
	 * @author Easily
	 */
	public class b2Utils 
	{
		public static const frameRate:Number = 30;
		public static const timeStep:Number = 1.0 / frameRate;
		public static const velIterations:int = 10;
		public static const posIterations:int = 10;
		public static const worldScale:Number = 30;
		
		private static function convertVec2(vec2:b2Vec2):b2Vec2
		{
			vec2 = vec2.Copy();
			vec2.x /= worldScale;
			vec2.y /= worldScale;
			return vec2;
		}

		public static function createRect(world:b2World, type:uint, pos:b2Vec2, size:b2Vec2, density:Number, friction:Number, restitution:Number, filterIndex:int = 0):b2Body
		{
			pos = convertVec2(pos);
			size = convertVec2(size);
			
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.position.Set(pos.x, pos.y);
			bodyDef.type = type;
			
			var shapeDef:b2PolygonShape = new b2PolygonShape();
			shapeDef.SetAsBox(size.x, size.y);
			
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			fixtureDef.density = density;
			fixtureDef.friction = friction;
			fixtureDef.restitution = restitution;
			fixtureDef.shape = shapeDef;
			fixtureDef.filter.groupIndex = filterIndex;
			
			var body:b2Body = world.CreateBody(bodyDef);
			body.CreateFixture(fixtureDef);
			return body;
		}

		public static function createRect2(world:b2World, type:uint, pos:b2Vec2, size:b2Vec2, offset:b2Vec2, angle:Number, density:Number, friction:Number, restitution:Number, filterIndex:int = 0):b2Body
		{
			pos = convertVec2(pos);
			size = convertVec2(size);
			offset = convertVec2(offset);
			
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.position.Set(pos.x, pos.y);
			bodyDef.type = type;
			
			var shapeDef:b2PolygonShape = new b2PolygonShape();
			shapeDef.SetAsOrientedBox(size.x, size.y, offset, Math.PI / 180 * angle);
			
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			fixtureDef.density = density;
			fixtureDef.friction = friction;
			fixtureDef.restitution = restitution;
			fixtureDef.shape = shapeDef;
			fixtureDef.filter.groupIndex = filterIndex;
			
			var body:b2Body = world.CreateBody(bodyDef);
			body.CreateFixture(fixtureDef);
			return body;
		}

		public static function createPolygon(world:b2World, type:uint, pos:b2Vec2, vertices:Object, density:Number, friction:Number, restitution:Number, filterIndex:int = 0):b2Body
		{
			pos = convertVec2(pos);
			var vertices_:Array = [];
			for each (var vertex:b2Vec2 in vertices)
			{
				vertices_.push(convertVec2(vertex));
			}
			
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.position.Set(pos.x, pos.y);
			bodyDef.type = type;
			
			var shapeDef:b2PolygonShape = new b2PolygonShape();
			shapeDef.SetAsArray(vertices_, vertices_.length);
			
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			fixtureDef.density = density;
			fixtureDef.friction = friction;
			fixtureDef.restitution = restitution;
			fixtureDef.shape = shapeDef;
			fixtureDef.filter.groupIndex = filterIndex;
			
			var body:b2Body = world.CreateBody(bodyDef);
			body.CreateFixture(fixtureDef);
			return body;
		}

		public static function createCircle(world:b2World, type:uint, pos:b2Vec2, radius:Number, density:Number, friction:Number, restitution:Number, filterIndex:int = 0):b2Body
		{
			pos = convertVec2(pos);
			radius /= worldScale;
			
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.position.Set(pos.x, pos.y);
			bodyDef.type = type;
			
			var shapeDef:b2CircleShape = new b2CircleShape(radius);
			
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			fixtureDef.density = density;
			fixtureDef.friction = friction;
			fixtureDef.restitution = restitution;
			fixtureDef.shape = shapeDef;
			fixtureDef.filter.groupIndex = filterIndex;
			
			var body:b2Body = world.CreateBody(bodyDef);
			body.CreateFixture(fixtureDef);
			return body;
		}

		public static function createWall(world:b2World, w:Number, h:Number, thickness:Number, density:Number, friction:Number, restitution:Number):void
		{
			var up:b2Body = createRect(world, b2Body.b2_staticBody, new b2Vec2(w / 2, 0), new b2Vec2(w / 2, thickness), density, friction, restitution);
			var bottom:b2Body = createRect(world, b2Body.b2_staticBody, new b2Vec2(w / 2, h), new b2Vec2(w / 2, thickness), density, friction, restitution);
			var left:b2Body = createRect(world, b2Body.b2_staticBody, new b2Vec2(0, h / 2), new b2Vec2(thickness, h / 2), density, friction, restitution);	
			var right:b2Body = createRect(world, b2Body.b2_staticBody, new b2Vec2(w, h / 2), new b2Vec2(thickness, h / 2), density, friction, restitution);	
		}

		public static function createDebug(host:Sprite, world:b2World, flags:uint, alpha:Number):void
		{
			var sprite:Sprite = new Sprite();
			host.addChild(sprite);
			
			var debug:b2DebugDraw = new b2DebugDraw();
			debug.SetSprite(sprite);
			debug.SetDrawScale(worldScale);
			debug.SetFlags(flags);
			debug.SetFillAlpha(alpha);
			world.SetDebugDraw(debug);
		}

		public static function mouseToWorld(stage:Stage):b2Vec2
		{
			return new b2Vec2(stage.mouseX / worldScale, stage.mouseY / worldScale);
		}

		public static function mouseJoint(stage:Stage, world:b2World):void
		{
			var mouseJoint:b2MouseJoint;
			stage.addEventListener(MouseEvent.MOUSE_DOWN, createJoint);
			function createJoint(event:MouseEvent):void
			{
				world.QueryPoint(queryPoint, mouseToWorld(stage));
			}
			function queryPoint(fixture:b2Fixture):Boolean
			{
				var body:b2Body = fixture.GetBody();
				if (body.GetType() == b2Body.b2_dynamicBody)
				{
					var jointDef:b2MouseJointDef = new b2MouseJointDef();
					jointDef.bodyA = world.GetGroundBody();
					jointDef.bodyB = body;
					jointDef.target = mouseToWorld(stage);
					jointDef.maxForce = 1000 * body.GetMass();
					mouseJoint = world.CreateJoint(jointDef) as b2MouseJoint;
					stage.addEventListener(MouseEvent.MOUSE_MOVE, moveJoint);
					stage.addEventListener(MouseEvent.MOUSE_UP, killJoint);	
				}
				return false;
			}
			function moveJoint(event:MouseEvent):void
			{
				mouseJoint.SetTarget(mouseToWorld(stage));
			}
			function killJoint(event:MouseEvent):void
			{
				world.DestroyJoint(mouseJoint);
				stage.removeEventListener(MouseEvent.MOUSE_MOVE, moveJoint);
				stage.removeEventListener(MouseEvent.MOUSE_UP, killJoint);
			}
		}

		public static function distanceJoint(world:b2World, bodyA:b2Body, bodyB:b2Body, localAnchorA:b2Vec2, localAnchorB:b2Vec2, length:Number):b2DistanceJoint
		{
			localAnchorA = convertVec2(localAnchorA);
			localAnchorB = convertVec2(localAnchorB);
			length /= worldScale;
				
			var jointDef:b2DistanceJointDef = new b2DistanceJointDef();
			jointDef.bodyA = bodyA;
			jointDef.bodyB = bodyB;
			jointDef.localAnchorA = localAnchorA;
			jointDef.localAnchorB = localAnchorB;
			jointDef.length = length;
			var joint:b2DistanceJoint = world.CreateJoint(jointDef) as b2DistanceJoint;
			return joint;
		}

		public static function revoluteJoint(world:b2World, bodyA:b2Body, bodyB:b2Body, localAnchorA:b2Vec2, localAnchorB:b2Vec2, enableMotor:Boolean = false, motorSpeed:Number = 0, maxMotorTorque:Number = 0):b2RevoluteJoint
		{
			localAnchorA = convertVec2(localAnchorA);
			localAnchorB = convertVec2(localAnchorB);
			
			var jointDef:b2RevoluteJointDef = new b2RevoluteJointDef();
			jointDef.bodyA = bodyA;
			jointDef.bodyB = bodyB;
			jointDef.localAnchorA = localAnchorA;
			jointDef.localAnchorB = localAnchorB;
			
			if (enableMotor)
			{
				jointDef.enableMotor = true;
				jointDef.motorSpeed = motorSpeed;
				jointDef.maxMotorTorque = maxMotorTorque;
			}
			
			var joint:b2RevoluteJoint = world.CreateJoint(jointDef) as b2RevoluteJoint;
			return joint;
		}
	}
}