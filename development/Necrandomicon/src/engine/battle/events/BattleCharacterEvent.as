package engine.battle.events 
{
	import engine.entities.EntityBattleCharacter;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class BattleCharacterEvent extends Event 
	{
		static public const START_TURN:String = "startTurn";
		static public const END_TURN:String = "endTurn";
		
		protected var _character:EntityBattleCharacter;
		
		public function BattleCharacterEvent(type:String, character:EntityBattleCharacter, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			_character = character;
		} 
		
		public override function clone():Event 
		{ 
			return new BattleCharacterEvent(type, _character,  bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("BattleCharacterEvent", "type", "character", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}