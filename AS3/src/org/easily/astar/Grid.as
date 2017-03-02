package org.easily.astar
{
	public class Grid
	{
		public var nodes:Vector.<Vector.<Node>>;
		public var numCols:int;
		public var numRows:int;

		public function Grid(numCols_:int, numRows_:int, size_:Number)
		{
			numCols = numCols_;
			numRows = numRows_;
			var size:Number = size_;
			var sizeh:Number = size_ / 2;
			nodes = new Vector.<Vector.<Node>>(numCols);
			for (var x:int = 0; x < numCols; x++)
			{
				nodes[x] = new Vector.<Node>(numRows);
				for (var y:int = 0; y < numRows; y++)
				{
					var node:Node = new Node();
					node.grid = this;
					node.x = x;
					node.y = y;
					node.px = x * size;
					node.py = y * size;
					node.cx = node.px + sizeh;
					node.cy = node.py + sizeh;
					nodes[x][y]= node;
				}
			}
		}
		
		public function toString():String
		{
			var content:String = "";
			for (var y:int = 0; y < numRows; y++)
			{
				for (var x:int = 0; x < numCols; x++)
				{
					content += nodes[x][y].toString() + ";";
				}
				content += "\n";
			}
			return content;
		}
		
		public function dispose():void
		{
			for (var x:int = 0; x < numCols; x++)
			{
				for (var y:int = 0; y < numRows; y++)
				{
					nodes[x][y].dispose();
				}
			}
			nodes = null;
		}
	}
}
