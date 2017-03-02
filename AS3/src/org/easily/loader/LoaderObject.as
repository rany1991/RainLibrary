package org.easily.loader
{
	import org.easily.ticker.TimeTicker;
	import org.easily.utils.ArrayUtils;

	public class LoaderObject
	{
		public var loaderMgr:LoaderManager;
		public var item:LoaderItem;
		public var clone:LoaderItem;
		public var loader:BaseLoader
		public var timer:int;
		public var loaderNum:int = 0;
		
		public function LoaderObject(loaderMgr_:LoaderManager)
		{
			loaderMgr = loaderMgr_;
		}
		
		public function load(item_:LoaderItem):void
		{
			item = item_;
			
			//文件是否存在
			if (item.url && !LoaderUtils.checkFile(item.url))
			{
				loaderMgr.fileNotExist(item);
				LoaderUtils.delayCall(loaderMgr.load);
				LoaderUtils.delayCall(dispose);
				return;
			}
			
			//是否缓存
			if (item.url && item.cache && loaderMgr.hasCache(item.url))
			{
				loaderMgr.applyCache(item.url, item.compFunc);
				LoaderUtils.delayCall(loaderMgr.load);
				LoaderUtils.delayCall(dispose);
				return;
			}
			
			//是否在加载队列
			if (item.url &&loaderMgr.isLoading(this))
			{
				loaderMgr.sameTask(this);
				LoaderUtils.delayCall(dispose);
				return;
			}
			
			//加载器
			clone = item.clone();
			clone.compFunc = onComplete;
			clone.openFunc = onOpen;
			clone.errorFunc = onError;
			var loaderCls:Class = LoaderUtils.getClass(clone.type);
			loader = new loaderCls;
			loader.load(clone);
			
			loaderMgr.addObj(this);
			if (!ArrayUtils.hasItem(LoaderUtils.refExcept, item.type))
			{
				loaderNum++;
				loaderMgr.loaderNum++;
			}
			
			//开始计时
			TimeTicker.clearTimeout(timer);
			timer = TimeTicker.setTimeout(item.timeout, onError);
		}
		
		//是否是同一个url加载
		public function equals(loaderObj_:LoaderObject):Boolean
		{
			return loaderObj_.item.url == item.url;
		}
		
		//建立连接，关闭计时器
		public function onOpen():void
		{
			TimeTicker.clearTimeout(timer);
			item.onOpen();
		}
		
		//加载成功
		public function onComplete(data:Object):void
		{
			loaderMgr.removeObj(this);
			loaderMgr.onComplete(item, data);
			dispose();
		}
		
		//加载失败,重试
		public function onError():void
		{
			++item.tries;
			if (item.tries < item.maxTries)
			{
				item.retry = true;
				loaderMgr.delayPush(item.clone());
			}
			else
			{
				loaderMgr.removeObj(this);
				loaderMgr.onError(item);
			}
			dispose();
		}
		
		//取消加载
		public function cancel():void
		{
			loaderMgr.onError(item);
			dispose();
		}
		
		//停止加载
		public function stop():void
		{
			item.retry = true;
			item.priority += LoaderConsts.MININUM_PRIORITY;
			loaderMgr.delayPush(item.clone(), LoaderConsts.STOP_TIME);
			dispose();
		}
		
		//销毁
		public function dispose():void
		{
			TimeTicker.clearTimeout(timer);
			if (loaderMgr)
			{
				loaderMgr.removeObj(this);
				loaderMgr.loaderNum -= loaderNum;
				loaderMgr = null;
			}
			if (loader)
			{
				loader.dispose();
				loader = null;
			}
			if (item)
			{
				item.dispose();
				item = null;
			}
			if (clone)
			{
				clone.dispose();
				clone = null;
			}
		}
	}
}