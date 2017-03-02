package org.easily.loader
{
	import de.polygonal.ds.Prioritizable;
	
	import flash.utils.ByteArray;
	import flash.utils.describeType;
	
	import org.easily.ds.QueuePriority;
	import org.easily.utils.StringUtils;

	//加载项
	public class LoaderItem extends Prioritizable
	{
		//初始化
		private static var _init:int = __init();
		private static function __init():int
		{
			keys = [];
			for each (var variable:XML in describeType(LoaderItem)..variable)
			{
				keys.push(String(variable.@name));
			}
			return -1;
		}
		
		public static var keys:Array;											//所有参数名称
		public var id:uint = LoaderUtils.genID();								//加载id
		public var type:String = LoaderType.RES;								//资源类型
		public var url:String;													//资源地址
		public var transform:Boolean = true;									//是否地址转换
		public var bytes:ByteArray;												//字节流
		public var compFunc:Function;											//加载完成回调
		public var errorFunc:Function;											//加载错误回调
		public var openFunc:Function;											//建立连接回调
		public var progFunc:Function;											//加载进度回调
		public var tries:int = 0;												//已尝试次数
		public var maxTries:int = LoaderConsts.MAX_TRIES;					//最大尝试次数
		public var retry:Boolean = false;										//是否是重试状态
		public var cache:Boolean = false;										//是否缓存
		public var timeout:Number = LoaderConsts.TIME_OUT;					//最大超时值
		public var tip:String = LoaderConsts.DEFAULT_TIP;					//加载说明
		public var idle:Boolean = false;										//空闲加载
		public var sames:Array = [];											//相同加载请求
		public var param:Object;												//附加参数
		
		public function LoaderItem()
		{
			priority = QueuePriority.MID;
		}
		
		public function onOpen():void
		{
			if(openFunc != null)
			{
				openFunc();
			}
		}
		
		public function onComplete(data:Object):void
		{
			if (compFunc != null)
			{
				compFunc(data);
				return;
				
				try
				{
					compFunc(data);
				}
				catch(error:Error) 
				{
					LoaderUtils.print("loaderItem.onComplete error="+toString());
				}
			}
		}
		
		public function onError():void
		{
			if (errorFunc != null)
			{
				errorFunc();
			}
		}
		
		public function clone():LoaderItem
		{
			var item:LoaderItem = new LoaderItem;
			item.id = id;
			item.type = type;
			item.url = url;
			item.transform = transform;
			item.bytes = bytes;
			item.compFunc = compFunc;
			item.errorFunc = errorFunc;
			item.openFunc = openFunc;
			item.progFunc = progFunc;
			item.tries = tries;
			item.maxTries = maxTries;
			item.retry = retry;
			item.cache = cache;
			item.timeout = timeout;
			item.priority = priority;
			item.tip = tip;
			item.param = param;
			item.sames = sames;
			return item;
		}
		
		override public function toString():String
		{
			// TODO Auto Generated method stub
			return StringUtils.substitute("loaderItem:id={0},type={1},url={2},cache={3}", id, type, url, cache);
		}
		
		public function dispose():void
		{
			url = null;
			bytes = null;
			compFunc = null;
			errorFunc = null;
			openFunc = null;
			progFunc = null;
			param = null;
			sames = null;
		}
	}
}