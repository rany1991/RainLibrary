package org.easily.loader
{
	/**
	 * @author Easily
	 */
	public class LoaderConsts
	{
		//最大同时加载数
		public static var LOADER_MAXIMUM:int = 10;
		
		//最大尝试次数
		public static var MAX_TRIES:int = 3;
		
		//最大超时
		public static var TIME_OUT:Number = 10000;
		
		//相同加载延时
		public static var SAME_TIME:Number = 100;
		
		//停止加载延时
		public static var STOP_TIME:Number = 1000;
		
		//最低优先级
		public static var MININUM_PRIORITY:int = -1;
		
		//默认说明
		public static var DEFAULT_TIP:String = "loading...";
	}
}