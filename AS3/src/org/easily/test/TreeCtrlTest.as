package org.easily.test 
{
	import org.easily.display.Container;
	import org.easily.ui.tips.ToolTip;
	import org.easily.ui.tree.TreeCtrl;

	public class TreeCtrlTest extends Container
	{
		public function TreeCtrlTest()
		{
			super();
			
			ToolTip.init(this);
			var root:TreeCtrl = new TreeCtrl();
			root.addSubItem(new Tree1(root));
			root.addSubItem(new Tree1(root));
			root.addSubItem(new Tree1(root));
			root.addSubItem(new Tree1(root));
			addChild(root);
		}
	}
}