package org.easily.ui.group
{
	/**
	 * @author Easily
	 */
	public interface IGroupItem
	{
		//选中
		function selectItem():void;
		
		//反选
		function deselectItem():void;
		
		//重新选择
		function reselectItem():void;
	}
}