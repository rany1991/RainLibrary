package org.easily.loader
{
	import flash.display.DisplayObjectContainer;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import org.easily.ticker.TickerUtils;
	import org.easily.utils.IDUtils;

	public class LoaderUtils
	{
		//name
		public static const NAME:String = "loader";
		
		//加载管理器
		public static var loaderMgr:LoaderManager = new LoaderManager();
		
		//引用计数例外，这些类型的资源引用计数不增加
		public static var refExcept:Array = [
			LoaderType.BYTES,
		];
		
		//缓存例外，这些类型的资源只需要标记
		public static var cacheExcept:Array = [
			LoaderType.DOMAIN,
		];
		
		//类型映射
		public static var loaderClass:Dictionary = initType();
		
		//初始化
		private static function initType():Dictionary 
		{
			loaderClass = new Dictionary;
			loaderClass[LoaderType.RES] = ResLoader;
			loaderClass[LoaderType.TEXT] = TextLoader;
			loaderClass[LoaderType.BINARY] = BinaryLoader;
			loaderClass[LoaderType.BYTES] = BytesLoader;
			loaderClass[LoaderType.DOMAIN] = DomainLoader;
			loaderClass[LoaderType.APP] = AppLoader;
			return loaderClass;
		}
		
		//获得加载类
		public static var getClass:Function = function(type:String):Class
		{
			var cls:Class = loaderClass[type];
			cls ||= EmptyLoader;
			return cls;
		}
		
		//url转换
		public static var translate:Function = function(url:String):String
		{
			return url;
		}
			
		//打印
		public static var print:Function = function(msg:String):void
		{
			trace(msg);
		}
			
		//是否本地存储
		public static var localSave:Function = function(url:String):Boolean
		{
			return false;
		}
		
		//文件是否存在
		public static var checkFile:Function = function(url:String):Boolean
		{
			return true;
		}
		
		//设置最大加载数量
		public static function set loaderMaximum(value:int):void
		{
			loaderMgr.loaderMaximum = value;
		}
		
		//最大加载数量
		public static function get loaderMaximum():int
		{
			return loaderMgr.loaderMaximum;
		}
		
		//克隆资源，该类资源只加载一次，可取得多个实例
		public static function cloneRes(url_:String, compFunc_:Function, errorFunc_:Function = null):uint
		{
			var bytes:ByteArray = ByteArray(getCache(url_));
			if (bytes)
			{
				loadBytes(bytes, compFunc_, errorFunc_);
				return 0;
			}
			
			return loadBinary(url_, onComplete, true, null, errorFunc_);
			function onComplete(bytes_:ByteArray):void
			{
				loadBytes(bytes_, compFunc_, errorFunc_);
			}
		}
		
		//加载普通资源：swf,jpg,png
		public static function loadRes(url_:String, compFunc_:Function, cache_:Boolean = false, progFunc_:Function = null, errorFunc_:Function = null):uint
		{
			return loaderMgr.loadData(LoaderType.RES, url_, null, compFunc_, cache_, progFunc_, errorFunc_);
		}
		
		//加载文本:xml,json
		public static function loadText(url_:String, compFunc_:Function, cache_:Boolean = false, progFunc_:Function = null, errorFunc_:Function = null):uint
		{
			return loaderMgr.loadData(LoaderType.TEXT, url_, null, compFunc_, cache_, progFunc_, errorFunc_);
		}
		
		//加载二进制
		public static function loadBinary(url_:String, compFunc_:Function, cache_:Boolean = false, progFunc_:Function = null, errorFunc_:Function = null):uint
		{
			return loaderMgr.loadData(LoaderType.BINARY, url_, null, compFunc_, cache_, progFunc_, errorFunc_);
		}
		
		//加载域
		public static function loadDomain(url_:String, compFunc_:Function = null, progFunc_:Function = null, errorFunc_:Function = null):uint
		{
			return loaderMgr.loadData(LoaderType.DOMAIN, url_, null, compFunc_, true, progFunc_, errorFunc_);
		}
		
		//加载新域
		public static function loadApp(url_:String, compFunc_:Function = null, cache_:Boolean = false, progFunc_:Function = null, errorFunc_:Function = null):uint
		{
			return loaderMgr.loadData(LoaderType.APP, url_, null, compFunc_, cache_, progFunc_, errorFunc_);
		}
		
		//加载字节流
		public static function loadBytes(bytes_:ByteArray, compFunc_:Function, errorFunc_:Function = null):uint
		{
			return loaderMgr.loadData(LoaderType.BYTES, null, bytes_, compFunc_, false, null, errorFunc_);
		}
		
		//加载一个加载项
		public static function loadItem(item:LoaderItem):uint
		{
			return loaderMgr.loadItem(item);
		}
		
		//加载一个队列，队列中的所有元素都是LoaderItem，加载资源不分先后
		public static function loadList(list:Array, compFunc_:Function = null, progFunc_:Function = null, errorFunc_:Function = null):void
		{
			var loader:ListLoader = new ListLoader(list, compFunc_, progFunc_, errorFunc_);
			loader.load();
		}
		
		//同loadList，区别是加载这个列队的时候会一个一个加载，直到最后一个加载完
		public static function loadListEx(list:Array, compFunc_:Function = null, progFunc_:Function = null, errorFunc_:Function = null):void
		{
			var loader:ListLoader = new ListLoaderEx(list, compFunc_, progFunc_, errorFunc_);
			loader.load();
		}
		
		//取消加载,删除加载请求
		public static function cancelIf(func:Function):void
		{
			loaderMgr.cancelIf(func);
		}
		
		//停止加载,加载请求优先级调低,延时加载
		public static function stopIf(func:Function):void
		{
			loaderMgr.stopIf(func);
		}
		
		//取消加载,删除加载请求
		public static function cancel(id:uint):void
		{
			loaderMgr.cancel(id);
		}
		
		//停止加载,加载请求优先级调低,延时加载
		public static function stop(id:uint):void
		{
			loaderMgr.stop(id);
		}
		
		//取消加载,删除加载请求
		public static function cancelEx(url:String):void
		{
			loaderMgr.cancelEx(url);
		}
		
		//停止加载,加载请求优先级调低,延时加载
		public static function stopEx(url:String):void
		{
			loaderMgr.stopEx(url);
		}
		
		//取消所有加载
		public static function cancelAll():void
		{
			loaderMgr.cancelAll();
		}
		
		//停止所有加载
		public static function stopAll():void
		{
			loaderMgr.stopAll();
		}
		
		//是否存在
		public static function hasCache(url_:String):Boolean
		{
			return loaderMgr.getCache(url_);
		}
		
		//取缓存
		public static function getCache(url_:String):Object
		{
			return loaderMgr.getCache(url_);
		}
		
		//释放缓存
		public static function releaseCache(url_:String):void
		{
			loaderMgr.releaseCache(url_);
		}
		
		//加载id
		public static function genID():uint
		{
			return IDUtils.genID(NAME);
		}
		
		//延迟调用
		public static function delayCall(func:Function, delay:Number = 0.001):void
		{
			TickerUtils.delayCall(func, delay);
		}
		
		//删除所有孩子
		public static function removeChildren(obj:Object):void
		{
			if (obj is DisplayObjectContainer)
			{
				while (obj.numChildren > 0)
				{
					obj.removeChildAt(0);
				}
			}
		}
	}
}