package
{
	import flash.display.Sprite;
	
	import org.rany.utils.Util;

//	import flash.text.TextField;
	
//	import org.rany.utils.TimeUtil;
	
	public class ranyLib extends Sprite
	{
//		[SWF(width="640", height="480", backgroundColor="0x414647")]
		public function ranyLib()
		{
			super();
//			addChild(new Box2dTest2);
			test();
		}
		
		private function test():void
		{
//			var text:TextField = new TextField();
//			text.text = "ranylib124";
//			addChild(text);
//			new Test();
//			text.text = TimeUtil.getSecToTime(43325);
//			testAry();
//			testDate();
			testLangs();
		}
		
		private function testLangs():void
		{
			var a:int = 0;
			var b:int = 0;
			var c:int = ++ a;
			var d:int = b ++;
			trace(c, d, a, b);
		}
		
		private function testDate():void
		{
			var date:Date = new Date(1458807810 * 1000);
			trace(date.getFullYear(), date.getMonth()+1, date.getDate(), date.getHours(),date.getMinutes(), date.getSeconds());
		}
		
		private function testAry():void
		{
			var ary:Array = [1, 5, 2, 7, 3, 10, 8, 12, 6, 3, 4, 4];
			trace("before:", ary);
			trace("after:", Util.insertionSort(ary));
		}
	}
}