package org.easily.astar
{
	public class NodeUtils
	{
		//某个结点是否可走，可能是多格子
		public static function walkable(grid:Grid, node:Node, size:int):Boolean
		{
			for (var x:int = 0; x < size; ++x)
			{
				for (var y:int = 0; y < size; ++y)
				{
					var test:Node = grid.nodes[node.x + x][node.y + y];
					if (!test.walkable)
					{
						return false;
					}
				}
			}
			return true;
		}
	}
}