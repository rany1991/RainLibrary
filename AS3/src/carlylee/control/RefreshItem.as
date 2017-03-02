package carlylee.control
{
	/**
	 * RefreshItem
	 *
	 * author: Eunjeong, Lee(carly.l86@gmail.com).
	 * created: Dec 12, 2013
	 */
	
	public class RefreshItem
	{
		public var group:String;
		public var id:String;
		public var func:Function;
		public var thisObject:Object;
		
		/**
		 * @param $key(String) It's a group name what this item will belong to.
		 * @param $id(String) In key value, the '$id' is must be unique value.
		 * @param $func(Function) The action what you want to.
		 * @param $thisObject(Object) The object to which the function is applied.
		 */		
		public function RefreshItem( $group:String, $id:String, $func:Function, $thisObject:Object ){
			this.group = $group;
			this.id = $id;
			this.func = $func;
			this.thisObject = $thisObject;
		}
	}
}