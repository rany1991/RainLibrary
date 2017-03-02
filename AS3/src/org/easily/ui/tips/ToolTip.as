package org.easily.ui.tips
{
	import com.greensock.TweenLite;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	
	import org.easily.display.Container;
	import org.easily.utils.DictionaryUtils;

	/**
	 * @author Easily
	 */
	public class ToolTip
	{
		public static var stage:DisplayObjectContainer;
		public static var stageW:Number;
		public static var stageH:Number;

		public static function init(stage_:DisplayObjectContainer, stageWidth:Number = 960, stageHeight:Number = 560):void
		{
			stage = stage_;
			stageW = stageWidth;
			stageH = stageHeight;
		}

		public var body:Container;
		public var bindMap:Dictionary;
		public var currentItem:Object;

		public function ToolTip()
		{
			bindMap = new Dictionary(true);
			createBody();
		}

		public function createBody():void
		{
			body = new Container();
		}

		public function binded(binder:DisplayObject):Boolean
		{
			return (bindMap[binder] != null);
		}

		public function bind(binder:DisplayObject, data:Object):void
		{
			if (binded(binder))
			{
				rebind(binder, data);
				return;
			}
			
			bindMap[binder] = data;
			binder.addEventListener(MouseEvent.ROLL_OVER, onMouseOver);
			binder.addEventListener(MouseEvent.ROLL_OUT, onMouseOut);
			binder.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMoving);
		}

		public function rebind(binder:DisplayObject, data:Object):void
		{
			if (binded(binder))
			{
				bindMap[binder] = data;
			}
			else
			{
				bind(binder, data);
			}
			if (currentItem == binder)
			{
				updateTip(bindMap[binder]);
			}
		}

		public function unbind(binder:DisplayObject):void
		{
			if (binded(binder))
			{
				delete bindMap[binder];
				binder.removeEventListener(MouseEvent.ROLL_OVER, onMouseOver);
				binder.removeEventListener(MouseEvent.ROLL_OUT, onMouseOut);
				binder.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMoving);
			}
			if (stage.contains(body))
			{
				stage.removeChild(body);
			}
		}

		public function unbindAll():void
		{
			for each (var binder:DisplayObject in DictionaryUtils.getKeys(bindMap))
			{
				unbind(binder);
			}
		}

		public function onMouseOver(e:MouseEvent):void
		{
			currentItem = e.target;
			updateTip(bindMap[e.target]);
			if (!stage.contains(body))
			{
				body.alpha = 0;
				stage.addChild(body);
				TweenLite.to(body, 0.2, {alpha:1});
			}
		}

		public function onMouseOut(e:MouseEvent):void
		{
			if (stage.contains(body))
			{
				stage.removeChild(body);
			}
			currentItem = null;
		}

		public function onMouseMoving(e:MouseEvent):void
		{
			if (e.stageX + body.width > stageW)
			{
				body.x = e.stageX - body.width;
			}
			else
			{
				body.x = e.stageX;
			}
			if (e.stageY + body.height + 20 > stageH) //这里20是指鼠标指针的高度，为了不让鼠标遮住提示框
			{
				body.y = e.stageY - body.height - 3; //这里的3是为了让鼠标的指针的尖端不遮住提示框，导致绑定对象得不到鼠标消息
			}
			else
			{
				body.y = e.stageY + 20;
			}
		}

		public function updateTip(data:Object):void
		{
		}
		
		public function dispose():void
		{
			if (body)
			{
				body.dispose();
				body = null;
			}
			if (bindMap)
			{
				DictionaryUtils.dispose(bindMap);
				bindMap = null;
			}
			currentItem = null;
		}
	}
}
