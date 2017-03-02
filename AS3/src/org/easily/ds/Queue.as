package org.easily.ds
{
	import org.easily.utils.ArrayUtils;

	/**
	 * @author Easily
	 */
	public class Queue
	{
		public var data:Array = [];
		
		public function Queue(data_:Array = null)
		{
			if (data_)
			{
				init(data_);
			}
		}
		
		//清空
		public function clear():void
		{
			data.length = 0;
		}
		
		//是否为空
		public function empty():Boolean
		{
			return (data.length == 0);
		}
		
		//用一个数组初始化数据
		public function init(data_:Array):void
		{
			for each (var item:Object in data_)
			{
				data.push(item);
			}
		}
		
		//添加到队尾
		public function push(param:*):void
		{
			data.push(param);
		}
		
		//插入到队首
		public function insert(item:*):void
		{
			data.unshift(item);
		}
		
		//删除元素
		public function remove(item:*):void
		{
			ArrayUtils.remove(data, item);
		}
		
		//是否包含
		public function hasItem(item:*):Boolean
		{
			return data.indexOf(item) != -1;
		}
		
		//出队
		public function pop():*
		{
			return data.shift();
		}
		
		//队首
		public function get peek():*
		{
			return data[0];
		}
		
		//队首
		public function get front():*
		{
			return data[0];
		}
		
		//队尾
		public function get back():*
		{
			return data[data.length - 1];
		}
		
		//队列长度
		public function get length():int
		{
			return data.length;
		}
		
		//每个元素执行这个方法
		public function forEach(func:Function):void
		{
			for each (var item:* in data)
			{
				func(item);
			}
		}
		
		public function dispose():void
		{
			data.length = 0;
		}
	}
}
