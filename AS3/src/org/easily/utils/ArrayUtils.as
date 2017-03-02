package org.easily.utils
{
	public class ArrayUtils
	{
		//将元素添加到列表尾
		public static function push(array:Array, item:Object, repeat:Boolean = false):void
		{
			if (array && item && (repeat || (!repeat && array.indexOf(item) == -1)))
			{
				array.push(item);
			}
		}

		//将元素从集合当中移除
		public static function remove(array:Array, item:Object, fast:Boolean = true):void
		{
			if (array && item)
			{
				var index:int = array.indexOf(item);
				if (index != -1)
				{
					if (fast)
					{
						fastRemove(array, item, index);
					}
					else
					{
						array.splice(index, 1);
					}
				}
			}
		}
		
		//快速移除，不保证顺序
		public static function fastRemove(array:Array, item:Object, index:int):void
		{
			array[index] = array[array.length - 1];
			array.pop();
		}
		
		//是否有某个元素
		public static function hasItem(array:Array, item:Object):Boolean
		{
			if (array && item)
			{
				return array.indexOf(item) != -1;
			}
			else
			{
				return false;
			}
		}
		
		//将多个元素从集合当中移除(不保证顺序)
		public static function removeList(array:Array, list:Array):Array
		{
			if (array && list)
			{
				for each (var item:Object in list)
				{
					remove(array, item);
				}
				return list;
			}
			else
			{
				return [];
			}
		}
		
		//将元素从集合当中移除
		public static function removeIf(array:Array, func:Object):Array
		{
			return removeList(array, findIf(array, func));
		}

		//在指定位置插入元素
		public static function insert(array:Array, item:Object, index:int, repeat:Boolean = false):void
		{
			if (array && item && (repeat || (!repeat && array.indexOf(item) == -1)))
			{
				if (index >= array.length)
				{
					array.push(item);
				}
				else
				{
					array.splice(index, 0, item);
				}
			}
		}

		//将数组切割成N个数组，每个数组n个元素
		public static function slice(array:Array, n:int):Array
		{
			if (array)
			{
				if (n <= 0 || n > array.length)
				{
					return [array];
				}
				
				var arrayList:Array = [];
				var count:int = Math.ceil(array.length / n);
				for (var i:int = 0; i < count; ++i)
				{
					var start:int = i * n;
					var end:int = Math.min(start + n, array.length);
					arrayList.push(array.slice(start, end));
				}
				return arrayList;
			}
			else
			{
				return [];
			}
		}
		
		//克隆
		public static function clone(array:Array):Array
		{
			if (array && array.length == 0)
			{
				var len:int = array.length;
				var array_:Array = new Array(len);
				for (var i:int = 0; i < len; ++i)
				{
					array_[i] = array[i];
				}
				return array_;
			}
			else
			{
				return [];
			}
		}
		
		//查找数组中等于某个属性的值
		public static function find(array:Array, prop:String, value:Object):Object
		{
			if (array && array.length)
			{
				for each (var obj:Object in array)
				{
					if (obj[prop] == value)
					{
						return obj;
					}
				}
			}
			return null;
		}
		
		//查找数组中等于某个属性的值
		public static function findEx(array:Array, value:*):Boolean
		{
			if (!array || array.length <= 0)
			{
				return false;
			}
			for each (var obj:Object in array)
			{
				if (obj == value)
				{
					return true;
				}
			}
			return false;
		}
		
		//查找数组中符合条件的对象
		public static function findIf(array:Array, func:Object):Array
		{
			var list:Array = [];
			if (array && func)
			{
				for each (var item:Object in array)
				{
					if (func(item))
					{
						list.push(item);
					}
				}
			}
			return list;
		}

		//以某个类的实例初始化数组
		public static function init(array:Array, clsRef:Class, len:int = -1):void
		{
			if (!array || !clsRef)
			{
				return;
			}
			if (len == -1)
			{
				len = array.length;
			}
			for (var i:int = 0; i < len; i++)
			{
				array[i] = new clsRef;
			}
		}
		
		//比较两个数组的元素是否一致
		public static function equals(array1:Array, array2:Array):Boolean
		{
			if (array1 == array2)
			{
				return true;
			}
			if (array1.length != array2.length)
			{
				return false;
			}
			for (var i:int = 0; i < array1.length; i++) 
			{
				if (array1[i] != array2[i])
				{
					return false;
				}
			}
			return true;
		}
		
		//去除重复的元素
		public static function unique(array:Array):Array
		{
			var list:Array = [];
			for each (var item:Object in array)
			{
				if (!hasItem(array, item))
				{
					list.push(item);
				}
			}
			return list;
		}

		//快速排序
		public static function quickSort(array:Array, compFunc:Object):void
		{
			if (array && compFunc)
			{
				quickRun(array, 0, array.length - 1, compFunc);
			}
		}

		private static function quickRun(array:Array, first:int, last:int, compFunc:Object):void
		{
			if (first < last)
			{
				swap(array, first, (first + last) / 2);
				var mid:int = first;
				for (var i:int = first + 1; i <= last; ++i)
				{
					if (!compFunc(array[first], array[i]))
					{
						swap(array, i, ++mid);
					}
				}
				swap(array, first, mid);
				quickRun(array, first, mid, compFunc);
				quickRun(array, mid + 1, last, compFunc);
			}
		}

		//插入排序
		public static function insertSort(array:Array, compFunc:Object):void
		{
			if (array && compFunc)
			{
				var len:int = array.length;
				for (var i:int = 1; i < len; ++i)
				{
					if (!compFunc(array[i - 1], array[i]))
					{
						insertRun(array, compFunc, i);
					}
				}
			}
		}

		private static function insertRun(array:Array, compFunc:Object, index:int):void
		{
			var value:Object = array[index];
			for (var i:int = index - 1; i >= 0; --i)
			{
				if (!compFunc(value, array[i]))
				{
					break;
				}
			}
			for (var j:int = index - 1; j > i; --j)
			{
				array[j + 1] = array[j];
			}
			array[i + 1] = value;
		}

		//交换数组的元素
		public static function swap(array:Array, i1:int, i2:int):void
		{
			var t:Object = array[i1];
			array[i1] = array[i2];
			array[i2] = t;
		}
		
		//获取平均值
		public static function average(array:Array):Number
		{
			var result:Number = 0;
			if (array)
			{
				for each (var value:Number in array)
				{
					result += value;
				}
				result /= array.length;
			}
			return result;
		}
		
		//循环
		public static function loop(count:int, func:Object):void
		{
			for (var i:int = 0; i < count; i++) 
			{
				func();
			}
		}
		
		//调用相应的方法
		public static function every(array:Array, func:String, ...args):void
		{
			for each (var item:Object in array)
			{
				if (item.hasOwnProperty(func))
				{
					var funcObj:Function = item[func];
					funcObj.apply(item, args);
				}
			}
		}
		
		//转成整数
		public static function toInt(array:Array):Array
		{
			var list:Array = [];
			for each (var item:Object in array)
			{
				list.push(int(item));
			}
			return list;
		}
	}
}