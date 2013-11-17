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
		protected var _possibleTargets:Vector.<EntityBattleCharacter>;
		protected var _targets:Vector.<EntityBattleCharacter>;
		
		public function BattleTurn() 
		{
			
		}
		
		public function setAction($action:BattleAction):void 
		{
			_action = $action;
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
		
		public function get possibleTargets():Vector.<EntityBattleCharacter> 
		{
			return _possibleTargets;
		}
		
		public function set possibleTargets(value:Vector.<EntityBattleCharacter>):void 
		{
			_possibleTargets = value;
		}
		
		public function get targets():Vector.<EntityBattleCharacter> 
		{
			return _targets;
		}
		
		public function set targets(value:Vector.<EntityBattleCharacter>):void 
		{
			_targets = value;
		}
	
	}

}