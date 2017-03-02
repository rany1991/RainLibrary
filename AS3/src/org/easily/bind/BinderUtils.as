package org.easily.bind
{
	import flash.utils.Dictionary;
	
	import mx.binding.utils.BindingUtils;
	
	import org.easily.utils.IDUtils;

	public class BinderUtils
    {
        public static var binderMap:Dictionary = new Dictionary;

        /**
         * 属性绑定，返回绑定id
         * @param site 绑定对象
         * @param prop 绑定属性
         * @param host 被绑定对象
         * @param chain 被绑定属性，当被绑定对象的该属性改变的时候，绑定对象的属性相应的改变
         */
        public static function bind(site:Object, prop:String, host:Object, chain:Object):int
        {
            var watcher:Object = BindingUtils.bindProperty(site, prop, host, chain);
            var id:int = IDUtils.genID("binder");
            binderMap[id] = watcher;
            return id;
        }

        /**
         * 解除绑定
         * @param id 绑定id
         */
        public static function unbind(id:int):void
        {
            var watcher:Object = binderMap[id];
            if (watcher) 
            {
                watcher.unwatch();
                delete binderMap[id];
            }
        }
    }
}