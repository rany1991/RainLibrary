package org.easily.test 
{
	import org.easily.display.Container;
	import org.easily.ui.tips.TextTip;
	import org.easily.ui.tree.TreeCtrl;
	import org.easily.ui.tree.TreeItem;
	
	public class Tree3 extends TreeItem
	{
		public function Tree3(listener:TreeCtrl, hgap:Number=5)
		{
			super(listener, hgap);
			
			body = new Container();
			body.graphics.beginFill(0x0000ff);
			body.graphics.drawRect(0, 0, 60, 20);
			body.graphics.endFill();
			addChild(body);
			
			TextTip.getInstance().bind(this, "tree3");
		}
	}
}