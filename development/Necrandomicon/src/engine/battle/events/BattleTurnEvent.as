package engine.battle.events 
{
	import engine.battle.turns.BattleTurn;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class BattleTurnEvent extends Event 
	{
		static public const START:String = "battleTurnStart";
		static public const END:String = "battleTurnEnd";
		
		private var _turn:BattleTurn
		
		public function BattleTurnEvent(type:String, turn:BattleTurn, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			_turn = turn;
		} 
		
		public override function clone():Event 
		{ 
			return new BattleTurnEvent(type, _turn, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("BattleTurnEvent", "type", "turn", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get turn():BattleTurn 
		{
			return _turn;
		}
		
	}
	
}