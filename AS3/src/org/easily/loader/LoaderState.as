package org.easily.loader
{
	internal class LoaderState
	{
		//初始化状态
		public static const INIT:int = 1;			
		
		//加载错误
		public static const ERROR:int = 2;		
		
		//建立连接
		public static const OPEN:int = 3;
		
		//加载完成
		public static const COMPLETE:int = 4;	
		
		//加载器已经销毁
		public static const DISPOSE:int = 5;		
	}
}