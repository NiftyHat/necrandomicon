package engine.battle.turns 
{
	import engine.battle.BattleAction;
	import engine.entities.EntityBattleCharacter;
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class BattleTurn 
	{
		
		protected var _character:EntityBattleCharacter;
		protected var _action:BattleAction; 
		
		public function BattleTurn() 
		{
			
		}
		
		public function get character():EntityBattleCharacter 
		{
			return _character;
		}
		
		public function get action():BattleAction 
		{
			return _action;
		}
		
		public function set character(value:EntityBattleCharacter):void 
		{
			_character = value;
		}
	
	}

}