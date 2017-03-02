package org.easily.astar
{
	import flash.geom.Point;
	
	import org.easily.utils.MathUtils;

	public class AStar
	{
		public var grid:Grid;
		public var path:Array;
		public var floydPath:Array;
		public var open:BinaryHeap = new BinaryHeap();
		public var version:int = 0;

		public function AStar(grid_:Grid)
		{
			grid = grid_;
		}

		public function findPath(start:Node, end:Node, deep:int):Boolean
		{
			open.data.length = 1;
			var iterations:int = (Math.abs(start.x - end.x) + Math.abs(start.y - end.y)) * deep;

			//search
			var node:Node = start;
			node.version = ++version;
			while (node != end && iterations--)
			{
				//8 neighbors
				var sx:int = Math.max(0, node.x - 1);
				var ex:int = Math.min(node.x + 1, grid.numCols - 1);
				var sy:int = Math.max(0, node.y - 1);
				var ey:int = Math.min(node.y + 1, grid.numRows - 1);
				for (var x:int = sx; x <= ex; ++x)
				{
					for (var y:int = sy; y <= ey; ++y)
					{
						var test:Node = grid.nodes[x][y];
						if (test == node || !test.walkable)
						{
							continue;
						}
						var cost:Number = Math.SQRT2;
						if (node.x == test.x || node.y == test.y)
						{
							cost = 1;
						}
						var g:Number = node.g + cost;
						var dx:Number = test.x - end.x;
						var dy:Number = test.y - end.y;
						var h:Number = Math.sqrt(dx * dx + dy * dy);
						var f:Number = g + h;
						if (test.version == version)
						{
							if (test.f > f)
							{
								test.f = f;
								test.g = g;
								test.h = h;
								test.parent = node;
							}
						}
						else
						{
							test.f = f;
							test.g = g;
							test.h = h;
							test.parent = node;
							open.insert(test);
							test.version = version;
						}
					}
				}
				if (open.data.length == 1)
				{
					return false;
				}
				node = open.pop();
			}
			
			if (node != end)
			{
				return false;
			}

			//build path
			path = [];
			path.unshift(node);
			while (node != start)
			{
				node = node.parent;
				path.unshift(node);
			}

			return true;
		}

		//多格子寻路
		public function findPathEx(start:Node, end:Node, size:int):Boolean
		{
			if (size == 1)
			{
//				return findPath(start, end);
			}

			open.data.length = 1;
			var iterations:int = (Math.abs(start.x - end.x) + Math.abs(start.y - end.y)) * 2;

			//search
			var node:Node = start;
			node.version = ++version;
			while (node != end && iterations--)
			{
				var t:int;
				t = node.x - size;
				var sx:int = (t < 0 ? node.x : t);
				t = node.x + size;
				var ex:int = (t > grid.numCols - size ? node.x : t);
				t = node.y - size;
				var sy:int = (t < 0 ? node.y : t);
				t = node.y + size;
				var ey:int = (t > grid.numRows - size ? node.y : t);
				for (var x:int = sx; x <= ex; x += size)
				{
					for (var y:int = sy; y <= ey; y += size)
					{
						var test:Node = grid.nodes[x][y];
						if (test == node || !NodeUtils.walkable(grid, test, size))
						{
							continue;
						}
						var cost:Number = Math.SQRT2;
						if (node.x == test.x || node.y == test.y)
						{
							cost = 1;
						}
						var g:Number = node.g + cost;
						var dx:Number = test.x - end.x;
						var dy:Number = test.y - end.y;
						var h:Number = Math.sqrt(dx * dx + dy * dy);
						var f:Number = g + h;
						if (test.version == version)
						{
							if (test.f > f)
							{
								test.f = f;
								test.g = g;
								test.h = h;
								test.parent = node;
							}
						}
						else
						{
							test.f = f;
							test.g = g;
							test.h = h;
							test.parent = node;
							open.insert(test);
							test.version = version;
						}
					}
				}
				if (open.data.length == 1)
				{
					return false;
				}
				node = open.pop();
			}

			//build path
			path = [];
			path.unshift(node);
			while (node != start)
			{
				node = node.parent;
				path.unshift(node);
			}

			return true;
		}
		
		public function buildPath():Array
		{
			if (path && path.length)
			{
				path.shift();
				var path_:Array = [];
				for each (var node:Node in path)
				{
					path_.push(new Point(node.cx, node.cy));
				}
				return path_;
			}
			return null;
		}
		
		public function buildlFloydPath():Array
		{
			floyd();
			if (floydPath && floydPath.length)
			{
				floydPath.shift();
				var path_:Array = [];
				for each (var node:Node in floydPath)
				{
					path_.push(new Point(node.cx, node.cy));
				}
				return path_;
			}
			return null;
		}

		public function floyd():void
		{
			if (path == null)
			{
				return;
			}
			floydPath = path.concat();
			var len:int = floydPath.length;
			if (len > 2)
			{
				var vector:Node = new Node();
				var tempVector:Node = new Node();
				floydVector(vector, floydPath[len - 1], floydPath[len - 2]);
				for (var i:int = floydPath.length - 3; i >= 0; i--)
				{
					floydVector(tempVector, floydPath[i + 1], floydPath[i]);
					if (vector.x == tempVector.x && vector.y == tempVector.y)
					{
						floydPath.splice(i + 1, 1);
					}
					else
					{
						vector.x = tempVector.x;
						vector.y = tempVector.y;
					}
				}
			}
			len = floydPath.length;
			for (i = len - 1; i >= 0; i--)
			{
				for (var j:int = 0; j <= i - 2; j++)
				{
					if (floydCrossAble(floydPath[i], floydPath[j]))
					{
						for (var k:int = i - 1; k > j; k--)
						{
							floydPath.splice(k, 1);
						}
						i = j;
						len = floydPath.length;
						break;
					}
				}
			}
		}

		private function floydCrossAble(n1:Node, n2:Node):Boolean
		{
			var ps:Array = MathUtils.bresenham(n1.x, n1.y, n2.x, n2.y);
			for (var i:int = ps.length - 2; i > 0; i--)
			{
				if (ps[i].x >= 0 && ps[i].y >= 0 && ps[i].x < grid.numCols && ps[i].y < grid.numRows && !grid.nodes[ps[i].x][ps[i].y].walkable)
				{
					return false;
				}
			}
			return true;
		}

		private function floydVector(target:Node, n1:Node, n2:Node):void
		{
			target.x = n1.x - n2.x;
			target.y = n1.y - n2.y;
		}

		public function dispose():void
		{
			grid = null;
			path = null;
			open.data = null;
			open = null;
			floydPath = null;
		}
	}
}
