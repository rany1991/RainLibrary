package org.easily.test
{
	import com.bit101.components.List;
	
	import org.easily.display.Container;
	
	public class ListTest extends Container
	{
		public function ListTest()
		{
			super();
			
			var list = new List(this, 100, 100);
		}
	}
}