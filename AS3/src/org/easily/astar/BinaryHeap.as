package org.easily.astar
{
	public class BinaryHeap
	{
		public var data:Vector.<Node> = new Vector.<Node>();

		public function BinaryHeap()
		{
			data.length = 1;
		} 

		public function insert(value:Node):void
		{
			var len:int = data.length;
			data[len] = value;
			var mid:int = len >> 1;
			while (len > 1 && data[len].f < data[mid].f)
			{
				var temp:Node = data[len];
				data[len] = data[mid];
				data[mid] = temp;
				len = mid;
				mid = len >> 1;
			}
		}

		public function pop():Node
		{
			var min:Node = data[1];
			data[1] = data[data.length - 1];
			data.pop();
			var p:int = 1;
			var len:int = data.length;
			var sp1:int = p << 1;
			var sp2:int = sp1 + 1;
			while (sp1 < len)
			{
				if (sp2 < len)
				{
					var minp:int = data[sp2].f < data[sp1].f ? sp2 : sp1;
				}
				else
				{
					minp = sp1;
				}
				if (data[minp].f < data[p].f)
				{
					var temp:Node = data[p];
					data[p] = data[minp];
					data[minp] = temp;
					p = minp;
					sp1 = p << 1;
					sp2 = sp1 + 1;
				}
				else
				{
					break;
				}
			}
			return min;
		}
	}
}
