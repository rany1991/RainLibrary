package org.easily.test
{
	import flash.utils.Dictionary;

	/**
	 * @author Easily
	 */
	public class RelyMap
	{
		public var dic:Dictionary = new Dictionary;
		
		public function RelyMap()
		{
		}
		
		public function set(skillId:int, ...args):void
		{
			dic[skillId] ||= [];
			dic[skillId].concat()
		}
	}
}