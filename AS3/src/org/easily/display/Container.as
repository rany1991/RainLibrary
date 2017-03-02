package org.easily.display
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	
	import org.easily.utils.ArrayUtils;
	
	/**
	 * @author Easily
	 */
	public class Container extends Sprite
	{
		public var eventMap:Dictionary = new Dictionary;
		
		public function Container()
		{
			super();
		}

		public override function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
			//TODO Auto-generated method stub
			super.addEventListener(type,listener,useCapture,priority,useWeakReference);
			eventMap[type] ||= [];
			ArrayUtils.push(eventMap[type], listener);
		}

		public override function hasEventListener(type:String):Boolean
		{
			//TODO Auto-generated method stub
			return super.hasEventListener(type);
		}

		public override function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void
		{
			//TODO Auto-generated method stub
			super.removeEventListener(type,listener,useCapture);
			ArrayUtils.remove(eventMap[type], listener);
		}
		
		override public function addChild(child:DisplayObject):DisplayObject
		{
			if (child)
			{
				return super.addChild(child);
			}
			return null;
		}
		
		override public function removeChild(child:DisplayObject):DisplayObject
		{
			if (child && child.parent == this)
			{
				return super.removeChild(child);
			}
			return null;
		}
		
		public function removeAll():void
		{
			while (numChildren > 0)
			{
				removeChildAt(0);
			}
		}
		
		public function dispose():void
		{
			removeAll();
			if (parent)
			{
				parent.removeChild(this);
			}
		}
	}
}