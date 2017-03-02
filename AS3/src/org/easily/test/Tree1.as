package org.easily.test 
{
	import org.easily.display.Container;
	import org.easily.ui.tree.TreeCtrl;
	import org.easily.ui.tree.TreeItem;
	
	public class Tree1 extends TreeItem
	{
		public function Tree1(listener:TreeCtrl, hgap:Number=5)
		{
			super(listener, hgap);
			
			body = new Container();
			body.graphics.beginFill(0xff0000);
			body.graphics.drawRect(0, 0, 100, 20);
			body.graphics.endFill();
			addChild(body);
			subTree.y = body.height + hgap;
			
			addSubItem(new Tree2(subTree));
		}
	}
}