package carlylee.control
{
	public class Command
	{
		/** Callback Method */
		private var _fnCallback:Function;
		
		/** Label */
		private var _label:String;
		
		/** Create New Command */
		public function Command( $label:String, $fnCallback:Function )
		{
			this._fnCallback = $fnCallback;
			this._label = $label;
		}
		
		/** Get Label */
		public function getLabel():String{
			return _label;
		}
		
		/** Execute */
		public function execute():void{
			_fnCallback();
		}
	}
}