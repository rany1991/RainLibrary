package org.easily.test.box2d
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
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	
	[SWF(width="640", height="480", backgroundColor="0x414647")]
	public class Box2dTest extends Sprite
	{
//		include "../../box2d/b2Utils.as";
		
//		private var world:b2World;
//		private var textField:TextField;
//		private var theBall:b2Body;
//		private var theIdol:b2Body;
//		private var sphereVector:Vector.<b2Body>;
//		private var mouseJoint:b2MouseJoint;
//		private var disJoint:b2DistanceJoint;
//		private var rJoint:b2RevoluteJoint;
		
		public function Box2dTest()
		{
//			if (stage) 
//			{
//				onInit();
//			}
//			else
//			{
//				addEventListener(Event.ADDED_TO_STAGE, onInit);
//			}
		}
		
//		private function onInit(event:Event=null):void
//		{
//			stage.frameRate = frameRate;
//			
//			var gravity:b2Vec2 = new b2Vec2(0, 9.81);
//			var sleep:Boolean = true;
//			world = new b2World(gravity, sleep);
//			world.SetContactListener(new CustomContact);
//			
//			// testBird();
////			var ballA:b2Body = createBall2(320, 50, 30);
////			var ballB:b2Body = createBall2(330, 50, 30);
////			
////			var disJointDef:b2DistanceJointDef = new b2DistanceJointDef();
////			disJointDef.bodyA = ballA;
////			disJointDef.bodyB = ballB;
////			disJointDef.length = 100 / worldScale;
////			disJoint = world.CreateJoint(disJointDef) as b2DistanceJoint;
//			
//			var brick:b2Body = createBrick(320, 240, 50, 50);
//			var rJointDef:b2RevoluteJointDef = new b2RevoluteJointDef();
//			rJointDef.bodyA = brick;
//			rJointDef.bodyB = world.GetGroundBody();
//			rJointDef.localAnchorA = new b2Vec2();
//			rJointDef.localAnchorB = brick.GetWorldCenter();
//			rJointDef.enableMotor = true;
//			rJointDef.motorSpeed = -5;
//			rJointDef.maxMotorTorque = 1000;
//			rJoint = world.CreateJoint(rJointDef) as b2RevoluteJoint;
//			
//			createFloor();
//			// testIdol();
//			// testSphere();
//			
//			createDebug(this, world, worldScale, b2DebugDraw.e_shapeBit | b2DebugDraw.e_jointBit, 0.5);
//			mouseJoint(stage, world, worldScale);
//			addEventListener(Event.ENTER_FRAME, onUpdate);
//			// stage.addEventListener(MouseEvent.CLICK, onClick);
//		}
//		
//		private function createBall():b2Body
//		{
//			var bodyDef:b2BodyDef = new b2BodyDef();
//			
//			bodyDef.position.Set(320 / worldScale, 50 / worldScale);
//			bodyDef.type = b2Body.b2_dynamicBody;
//			
//			var circleShape:b2CircleShape = new b2CircleShape(30 / worldScale);
//			
//			var fixtureDef:b2FixtureDef = new b2FixtureDef();
//			fixtureDef.shape = circleShape;
//			
//			fixtureDef.density = 2;
//			fixtureDef.restitution = 0.8;
//			fixtureDef.friction = 0.1;
//			
//			theBall = world.CreateBody(bodyDef);
//			theBall.CreateFixture(fixtureDef);
//			return theBall;
//		}
//		
//		private function createBall2(x:Number, y:Number, radius:Number):b2Body
//		{
//			var bodyDef:b2BodyDef = new b2BodyDef();
//			
//			bodyDef.position.Set(x / worldScale, y / worldScale);
//			bodyDef.type = b2Body.b2_dynamicBody;
//			
//			var circleShape:b2CircleShape = new b2CircleShape(radius / worldScale);
//			
//			var fixtureDef:b2FixtureDef = new b2FixtureDef();
//			fixtureDef.shape = circleShape;
//			
//			fixtureDef.density = 2;
//			fixtureDef.restitution = 0.8;
//			fixtureDef.friction = 0.1;
//			
//			var ball:b2Body = world.CreateBody(bodyDef);
//			ball.CreateFixture(fixtureDef);
//			return ball;
//		}
//		
//		private function createFloor():void
//		{
//			var bodyDef:b2BodyDef = new b2BodyDef();
//			bodyDef.position.Set(320 / worldScale, 465 / worldScale);
//			bodyDef.type = b2Body.b2_staticBody;
//			bodyDef.userData = "Floor";
//			
//			var polygonShape:b2PolygonShape = new b2PolygonShape();
//			polygonShape.SetAsBox(320 / worldScale, 15 / worldScale);
//
//			var fixtureDef:b2FixtureDef = new b2FixtureDef();
//			fixtureDef.density = 1;
//			fixtureDef.restitution = 0.4;
//			fixtureDef.friction = 0.5;
//			fixtureDef.shape = polygonShape;
//			
//			var theFloor:b2Body = world.CreateBody(bodyDef);
//			theFloor.CreateFixture(fixtureDef);
//		}
//		
//		private function createBrick(x:Number, y:Number, w:Number, h:Number):b2Body
//		{
//			var bodyDef:b2BodyDef = new b2BodyDef;
//			bodyDef.position.Set(x / worldScale, y / worldScale);
//			bodyDef.type = b2Body.b2_dynamicBody;
//			bodyDef.userData = "Brick";
//			
//			var polygonShape:b2PolygonShape = new b2PolygonShape;
//			polygonShape.SetAsBox(w / 2 / worldScale, h / 2 / worldScale);
//			
//			var fixtureDef:b2FixtureDef = new b2FixtureDef;
//			fixtureDef.shape = polygonShape;
//			fixtureDef.density = 2;
//			fixtureDef.restitution = 0.4;
//			fixtureDef.friction = 0.5;
//			
//			var theBrick:b2Body = world.CreateBody(bodyDef);
//			theBrick.CreateFixture(fixtureDef);
//			return theBrick;
//		}
//		
//		private function createIdol(x:Number, y:Number):void
//		{
//			var bodyDef:b2BodyDef = new b2BodyDef;
//			bodyDef.position.Set(x / worldScale, y / worldScale);
//			bodyDef.type = b2Body.b2_dynamicBody;
//			
//			var polygonShape:b2PolygonShape = new b2PolygonShape;
//			polygonShape.SetAsBox(5 / worldScale, 20 / worldScale);
//			
//			var fixtureDef:b2FixtureDef = new b2FixtureDef;
//			fixtureDef.shape = polygonShape;
//			fixtureDef.density = 1;
//			fixtureDef.restitution = 0.4;
//			fixtureDef.friction = 0.5;
//			
//			theIdol = world.CreateBody(bodyDef);
//			theIdol.CreateFixture(fixtureDef);
//			
//			var w:Number = 5 / worldScale;
//			var h:Number = 20 / worldScale;
//			var pos:b2Vec2 = new b2Vec2(0, 10 / worldScale);
//			var angle:Number = -Math.PI / 4;
//			
//			polygonShape.SetAsOrientedBox(w, h, pos, angle);
//			fixtureDef.shape = polygonShape;
//			theIdol.CreateFixture(fixtureDef);
//			
//			angle = Math.PI / 4;
//			polygonShape.SetAsOrientedBox(w, h, pos, angle);
//			fixtureDef.shape = polygonShape;
//			theIdol.CreateFixture(fixtureDef);
//		}
//		
//		private function createSphere(x:Number, y:Number, r:Number):b2Body
//		{
//			var bodyDef:b2BodyDef = new b2BodyDef(); 
//			bodyDef.position.Set(x / worldScale,y / worldScale); 
//			bodyDef.type = b2Body.b2_dynamicBody; 
//			var circleShape:b2CircleShape = new b2CircleShape(r / worldScale); 
//			var fixtureDef:b2FixtureDef = new b2FixtureDef(); 
//			fixtureDef.shape = circleShape; 
//			fixtureDef.density = 2; 
//			fixtureDef.restitution = 0.4; 
//			fixtureDef.friction = 0.5; 
//			var theSphere:b2Body = world.CreateBody(bodyDef); 
//			theSphere.CreateFixture(fixtureDef); 
//			return theSphere; 
//		}
//		
//		private function testIdol():void
//		{
//			createBrick(275,435,30,30);
//			createBrick(365,435,30,30);
//			createBrick(320,405,120,30);
//			createBrick(320,375,60,30);
//			createBrick(305,345,90,30);
//			createBrick(320,300,120,60);
//			createIdol(320, 242);
//			
//			textField = new TextField();
//			textField.type = TextFieldType.DYNAMIC;
//			textField.autoSize = TextFieldAutoSize.LEFT;
//			textField.textColor = 0xffffff;
//			addChild(textField);
//		}
//		
//		private function testSphere():void
//		{
//			sphereVector = new Vector.<b2Body>();
//			for (var i:int = 0; i < 3; i++) 
//			{
//				sphereVector.push(createSphere(170 + i * 150, 410, 40));
//			}
//			
//			var force:b2Vec2=new b2Vec2(0,-15);
//			var force2:b2Vec2 = force.Copy();
//			force2.Multiply(sphereVector[1].GetMass());
//			var force3:b2Vec2 = force2.Copy();
//			force3.Multiply(frameRate);
//			var sphereCenter:b2Vec2=sphereVector[0].GetWorldCenter();
//			sphereVector[0].ApplyForce(force3,sphereCenter);
//			sphereCenter=sphereVector[1].GetWorldCenter();
//			sphereVector[1].ApplyImpulse(force2,sphereCenter);
//			sphereVector[2].SetLinearVelocity(force);
//		}
//
//
//		private var theBird:Sprite=new Sprite(); 
//		private var slingX:int=100; 
//		private var slingY:int=250; 
//		private var slingR:int=75;
//		 
//		private function testBird():void 
//		{
//			createBrick(402,431,140,36); 
//			createBrick(544,431,140,36); 
//			createBrick(342,396,16,32); 
//			createBrick(604,396,16,32); 
//			createBrick(416,347,16,130); 
//			createBrick(532,347,16,130); 
//			createBrick(474,273,132,16); 
//			createBrick(474,257,32,16); 
//			createBrick(445,199,16,130); 
//			createBrick(503,199,16,130); 
//			createBrick(474,125,58,16); 
//			createBrick(474,100,32,32); 
//			createBrick(474,67,16,32); 
//			createBrick(474,404,64,16); 
//			createBrick(450,363,16,64); 
//			createBrick(498,363,16,64); 
//			createBrick(474,322,64,16); 
//
//			var slingCanvas:Sprite=new Sprite(); 
//			slingCanvas.graphics.lineStyle(1,0xffffff); 
//			slingCanvas.graphics.drawCircle(0,0,slingR); 
//			addChild(slingCanvas); 
//			slingCanvas.x=slingX; 
//			slingCanvas.y=slingY; 
//			theBird.graphics.lineStyle(1,0xfffffff); 
//			theBird.graphics.beginFill(0xffffff); 
//			theBird.graphics.drawCircle(0,0,15); 
//			addChild(theBird); 
//			theBird.x=slingX; 
//			theBird.y=slingY; 
//			theBird.addEventListener(MouseEvent.MOUSE_DOWN,birdClick);
//		}
//
//		private function birdClick(e:MouseEvent):void 
//		{
//			stage.addEventListener(MouseEvent.MOUSE_MOVE,birdMove);
//			stage.addEventListener(MouseEvent.MOUSE_UP,birdRelease);
//			theBird.removeEventListener(MouseEvent.MOUSE_DOWN,birdClick);
//		}
//
//		private function birdMove(e:MouseEvent):void 
//		{ 
//			theBird.x=mouseX; 
//			theBird.y=mouseY; 
//			var distanceX:Number=theBird.x-slingX; 
//			var distanceY:Number=theBird.y-slingY; 
//			if (distanceX*distanceX+distanceY*distanceY>slingR*slingR) 
//			{ 
//				var birdAngle:Number=Math.atan2(distanceY,distanceX);        
//				theBird.x=slingX+slingR*Math.cos(birdAngle); 
//				theBird.y=slingY+slingR*Math.sin(birdAngle); 
//			} 
//		} 
//		private function birdRelease(e:MouseEvent):void 
//		{ 
//			var distanceX:Number=theBird.x-slingX; 
//			var distanceY:Number=theBird.y-slingY; 
//			var velocityX:Number=distanceX*-1/5; 
//			var velocityY:Number=distanceY*-1/5; 
//			var birdVelocity:b2Vec2=new b2Vec2(velocityX,velocityY); 
//
//			var sphereX:Number=theBird.x/worldScale; 
//			var sphereY:Number=theBird.y/worldScale; 
//			var r:Number = 15/worldScale; 
//			var bodyDef:b2BodyDef=new b2BodyDef(); 
//			bodyDef.position.Set(sphereX,sphereY); 
//			bodyDef.type = b2Body.b2_dynamicBody;
//			bodyDef.userData = "Ball";
//			var circleShape:b2CircleShape=new b2CircleShape(r); 
//			var fixtureDef:b2FixtureDef=new b2FixtureDef(); 
//			fixtureDef.shape=circleShape; 
//			fixtureDef.density=4; 
//			fixtureDef.restitution=0.4; 
//			fixtureDef.friction=0.5; 
//			var physicsBird:b2Body=world.CreateBody(bodyDef); 
//			physicsBird.CreateFixture(fixtureDef); 
//			physicsBird.SetLinearVelocity(birdVelocity);
//			
//			removeChild(theBird); 
//			stage.removeEventListener(MouseEvent.MOUSE_MOVE,birdMove); 
//			stage.removeEventListener(MouseEvent.MOUSE_UP,birdRelease); 
//		} 	
//
//		private function onUpdate(event:Event):void
//		{
//			world.Step(timeStep, velIterations, posIterations);
//			
////			var target:b2Body = theIdol;
////			var str:String = "pos:";
////			var pos:b2Vec2 = target.GetPosition();
////			str += "x=" + Math.round(pos.x * worldScale) + ",y=" + Math.round(pos.y * worldScale);
////			str += "\n" + "angle:" + Math.round(target.GetAngle() * 180 / Math.PI);
////			var vel:b2Vec2 = target.GetLinearVelocity();
////			str += "\n" + "velocity:" + "x=" + Math.round(vel.x * worldScale) + ",y=" + Math.round(vel.y * worldScale);
////			textField.text = str;
//			
////			for (var body:b2Body = world.GetBodyList(); body; body = body.GetNext())
////			{
////				for (var contact:b2ContactEdge = body.GetContactList(); contact; contact = contact.next)
////				{
////					
////				}
////			}
//			
//			world.ClearForces();
//			world.DrawDebugData();
//		}
//		
//		private function onClick(event:MouseEvent):void
//		{
//			var x:Number = mouseX / worldScale;
//			var y:Number = mouseY / worldScale;
//			world.QueryPoint(queryClick, new b2Vec2(x, y));
//		}
//		
//		private function queryClick(fixture:b2Fixture):Boolean
//		{
//			var body:b2Body = fixture.GetBody();
//			world.DestroyBody(body);
//			return false;
//		}
	}
}