package org.easily.utils
{
	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 * @author Easily
	 */
	public class MathUtils
	{
		private static const _tr2a:Number = 180 / Math.PI;
		private static const _ta2r:Number = Math.PI / 180;
		
		//弧度转角度
		public static function r2a(r:Number):Number
		{
			return r * _tr2a;
		}
		
		//角度转弧度
		public static function a2r(a:Number):Number
		{
			return a * _ta2r;
		}

		//求两点之间的夹角
		public static function angle(x1:Number, y1:Number, x2:Number, y2:Number):Number
		{
			return r2a(Math.atan2(y2 - y1, x2 - x1));
		}

		//将给定的数值限定在一个范围内
		public static function limit(value:Number, min:Number, max:Number):Number
		{
			return Math.max(min, Math.min(value, max));
		}
		
		//将给定的数值限定在一个范围内
		public static function limitMax(value:Number, min:Number, max:Number):Number
		{
			return Math.max(min, Math.max(value, max));
		}
		
		//两点之间的斜率
		public static function atan2(pt1:Point, pt2:Point):Number
		{
			return Math.atan2(pt2.y - pt1.y, pt2.x - pt1.x);
		}

		//计算两点间距离
		public static function distance(x1:Number, y1:Number, x2:Number, y2:Number):Number
		{
			var dx:Number = x2 - x1;
			var dy:Number = y2 - y1;
			return Math.sqrt(dx * dx + dy * dy);
		}

		//点到直线的距离p3到p1-p2的距离
		public static function pointToLine(pt:Point, linePt1:Point, linePt2:Point):Number
		{
			var xDelta:Number = linePt2.x - linePt1.x;
			var yDelta:Number = linePt2.y - linePt1.y;
			if ((xDelta == 0) && (yDelta == 0))
			{
				// p1 and p2 cannot be the same point
				linePt2.x += 1;
				linePt2.y += 1;
				xDelta = 1;
				yDelta = 1;
			}
			var u:Number = ((pt.x - linePt1.x) * xDelta + (pt.y - linePt1.y) * yDelta) / (xDelta * xDelta + yDelta * yDelta);
			var closestPoint:Point;
			if (u < 0)
			{
				closestPoint = linePt1;
			}
			else if (u > 1)
			{
				closestPoint = linePt2;
			}
			else
			{
				closestPoint = new Point(linePt1.x + u * xDelta, linePt1.y + u * yDelta);
			}
			return Point.distance(closestPoint, pt);
		}

		//返回在min与max之间的随机数，包括浮点数
		public static function randNumber(min:Number, max:Number):Number
		{
			return Math.min(Math.random() * (max - min + 1) + min, max);
		}

		//返回在min与max之间的随机整数
		public static function randInteger(min:int, max:int):int
		{
			return int(randNumber(min, max));
		}
		
		//给一个数字，随机一个范围，处于该数字的正负之间
		public static function randBound(num:Number):Number
		{
			num = Math.abs(num);
			return randNumber(-num, num);
		}
		
		//森汉姆算法，求一条直线所经过的点 
		public static function bresenham(x1:int, y1:int, x2:int, y2:int):Array
		{
			var touched:Array = [];
			var steep:Boolean = Math.abs(y2 - y1) > Math.abs(x2 - x1);
			if (steep)
			{
				var tmp:int;
				tmp = x1;
				x1 = y1;
				y1 = tmp;
				tmp = x2;
				x2 = y2;
				y2 = tmp;
			}
			if (x1 > x2)
			{
				var x1_old:int = x1;
				var y1_old:int = y1;
				x1 = x2;
				x2 = x1_old;
				y1 = y2;
				y2 = y1_old;
			}
			var deltax:int = x2 - x1;
			var deltay:int = Math.abs(y2 - y1);
			var error:int = deltax / 2;
			var ystep:int;
			var y:int = y1;
			if (y1 < y2)
			{
				ystep = 1;
			}
			else
			{
				ystep = -1;
			}
			for (var x:int = x1; x <= x2; ++x)
			{
				if (steep)
				{
					touched.push(new Point(y, x));
				}
				else
				{
					touched.push(new Point(x, y));
				}
				error = error - deltay;
				if (error < 0)
				{
					y = y + ystep;
					error = error + deltax;
				}
			}
			return touched;
		}
		
		//计算两个数字之间的差值
		public static function abs(num1:Number, num2:Number):Number
		{
			return Math.abs(num1 - num2);
		}
		
		//射线，从一个点，延着一个方向距离某个长度的一个点
		public static function rayXY(startX:Number, startY:Number, endX:Number, endY:Number, startX2:Number, startY2:Number, len:Number):Point
		{
			var radian:Number = Math.atan2(endY - startY, endX - startX);
			return ray(new Point(startX2, startY2), radian, len);
		}
		
		//射线，从一个点，延着一个方向距离某个长度的一个点
		public static function rayPt(start:Point, end:Point, start2:Point, len:Number):Point
		{
			return rayXY(start.x, start.y, end.x, end.y, start2.x, start2.y, len)
		}
		
		//射线，从一个点，延着一个方向距离某个长度的一个点
		public static function ray(pt:Point, radian:Number, len:Number):Point
		{
			return rayLen(pt.x, pt.y, radian, len);
		}
		
		//射线，从一个点，延着一个方向距离某个长度的一个点
		public static function rayLen(x:Number, y:Number, radian:Number, len:Number):Point
		{
			var x_:Number = Math.cos(radian) * len + x;
			var y_:Number = Math.sin(radian) * len + y;
			return new Point(x_, y_);
		}
		
		//一个值是否在指定的区间
		public static function between(value:Number, min:Number, max:Number):Boolean
		{
			return value >= min && value <= max;
		}
		
		//克隆
		public static function clone(array:Array):Array
		{
			if (!array || array.length == 0)
			{
				return [];
			}
			var len:int = array.length;
			var array_:Array = new Array(len);
			for (var i:int = 0; i < len; ++i)
			{
				array_[i] = array[i];
			}
			return array_;
		}
		
		//在指定位置插入元素
		public static function insert(array:Array, item:Object, index:int, repeat:Boolean = false):Boolean
		{
			if (!array || !item)
			{
				return false;
			}
			if (!repeat)
			{
				if (array.indexOf(item) == -1)
				{
					array.splice(index, 0, item);
					return true;
				}
				else
				{
					return false;
				}
			}
			else
			{
				array.splice(index, 0, item);
				return true;
			}
		}
		
		//插入列表
		public static function insertList(array:Array, list:Array, index:int, repeat:Boolean = false):void
		{
			if (!array || !list)
			{
				return;
			}
			var list_:Array = clone(list);
			while (list_.length > 0) 
			{
				if (insert(array, list_.shift(), index, repeat))
				{
					++index;
				}
			}
		}
	}
}
