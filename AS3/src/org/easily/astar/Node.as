package org.easily.astar
{
	public class Node
	{
		public var parent:Node;
		public var grid:Grid;
		public var data:Object = null;
		public var x:int;
		public var y:int;
		public var px:Number;//左上角x
		public var py:Number;//左上角y
		public var cx:Number;//中心x
		public var cy:Number;//中心y
		public var f:Number = 0;
		public var g:Number = 0;
		public var h:Number = 0;
		public var walkable:Boolean = true;
		public var version:int = 0;
		
		public function dispose():void
		{
			parent = null;
			grid = null;
			data = null;
		}

		public function toString():String
		{
			return "(x="+x+",y="+y+","+(walkable ? "0" : "1")+")";
		}
	}
}
