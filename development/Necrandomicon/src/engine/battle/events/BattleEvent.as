package engine.battle.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class BattleEvent extends Event 
	{
		
		protected var _data:*;
		
		public function BattleEvent(type:String,data:*, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, data, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new BattleEvent(type, data, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("BattleEvent", "data", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get data():* 
		{
			return _data;
		}
		
	}
	
}