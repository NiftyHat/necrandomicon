package engine.statistics 
{
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class Stat 
	{
		
		protected var _id:String = "";
        protected var _current:Number = 0;
        protected var _totalModified:Number = 0;
        protected var _totalUnmodified:Number = 0;
        protected var _modifiers:Object = { };
		
		public function Stat() 
		{
			
		}
		
		public function randomize($perc:Number = 1.0):void {
			var perc:Number = Math.random() * $perc;
			if (perc < 0) perc = 0;
			var newVal:int = _totalModified * perc;
			current = newVal;
		}
		
		public function get id():String 
		{
			return _id;
		}
		
		public function set id(value:String):void 
		{
			_id = value;
		}
		
		public function get current():Number 
		{
			return _current;
		}
		
		public function set current(value:Number):void 
		{
			_current = value;
			if (_current < 0) _current = 0;
			if (_current > _totalModified)  _current = _totalModified
		}
		
		public function get totalModified():Number 
		{
			return _totalModified;
		}
		
		public function set totalModified(value:Number):void 
		{
			_totalModified = value;
		}
		
		public function get totalUnmodified():Number 
		{
			return _totalUnmodified;
		}
		
		public function set totalUnmodified(value:Number):void 
		{
			_totalUnmodified = value;
			updateTotalModified();
		}
		
		private function updateTotalModified():void 
		{
			//TODO - add in stat modifier code here.
			_totalModified = _totalUnmodified
		}
		
	}

}