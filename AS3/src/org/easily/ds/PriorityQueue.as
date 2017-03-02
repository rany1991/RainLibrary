package org.easily.ds
{
	import org.easily.utils.ArrayUtils;

	public class PriorityQueue extends Queue
	{
		//优先队列
		public function PriorityQueue(data_:Array=null)
		{
			super(data_);
		}
		
		override public function insert(item:*):void
		{
			// TODO Auto Generated method stub
			super.insert(item);
			ArrayUtils.insertSort(data, compFunc);
		}
		
		override public function push(param:*):void
		{
			// TODO Auto Generated method stub
			super.push(param);
			ArrayUtils.insertSort(data, compFunc);
		}
		
		//优先级高的排在队列前面
		private static function compFunc(item1:Object, item2:Object):Boolean
		{
			return item1.priority < item2.priority;
		}
	}
}