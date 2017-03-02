package org.easily.debug
{
	import com.hurlant.eval.ByteLoader;
	import com.hurlant.eval.Evaluator;

	/**
	 * @author Easily
	 */
	public class Eval
	{
		public static var evaluator:Evaluator = new Evaluator;
		
		public static function eval(src:String, inplace:Boolean = false):Boolean
		{
			return ByteLoader.loadBytes(evaluator.eval(src), inplace);
		}
	}
}