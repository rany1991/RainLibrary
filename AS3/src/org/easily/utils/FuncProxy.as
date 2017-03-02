package org.easily.utils
{
	import org.easily.ticker.TickerUtils;

	public class FuncProxy
	{
		public var thisObj:Object;
		public var func:Function;
		public var argArray:Array;
		
		public function FuncProxy(thisObj_:Object, func_:Function, ...argArray_)
		{
			thisObj = thisObj_;
			func = func_;
			argArray = argArray_;
		}
		
		public function call():void
		{
			if (func != null)
			{
				func.apply(thisObj, argArray);
			}
			dispose();
		}
		
		public function delayCall(time:Number = 0.000001):void
		{
			TickerUtils.delayCall(call, time);
		}
		
		public function dispose():void
		{
			thisObj = null;
			func = null;
			argArray = null;
		}
	}
}