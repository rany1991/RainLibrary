package org.easily.test
{
	import flash.display.Sprite;
	import flash.utils.describeType;
	
	import mx.binding.utils.BindingUtils;
	
	import org.easily.debug.Log;
	

	/**
	 * @author Easily
	 */
	[Bindable]
	public class BindTest extends Sprite
	{
		// [Bindable]
		public var str:String = "";
		
//		[Bindable]
		public var obj2:BindObjTest = new BindObjTest; 

		public function BindTest()
		{
			super();

			var obj:Object = {str:""};
			BindingUtils.bindProperty(obj, "str", this, "str");
			BindingUtils.bindSetter(test,this,"str");
			var xml = describeType(this);
			trace(xml.toString())
			str = "test";
			Log.print(obj.str);
			BindingUtils.bindProperty(obj, "str", obj2, "str");
			obj2.str = "Easily";
			trace(obj.str)
			function test(...args):void
			{
				trace(args)
			}
		}
	}
}

class BindObjTest
{
	[Bindable]
	public var str:String;
}