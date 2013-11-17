package engine.battle 
{
	import engine.battle.events.UIEvent;
	import engine.battle.turns.ConditionalTurn;
	import engine.battle.turns.ConditionalTurnManager;
	import engine.entities.EntityBattleCharacter;
	import flash.events.EventDispatcher;
	import game.crux.Crux;
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class BattleEncounter extends EventDispatcher
	{
		
		private var _characters:Vector.<EntityBattleCharacter>
		
		private var _teamAlly:Vector.<EntityBattleCharacter>;
		private var _teamEnemy:Vector.<EntityBattleCharacter>;
		
		private var _turnManager:ConditionalTurnManager;
		
		public function BattleEncounter() 
		{
			init();
			addAlly(new EntityBattleCharacter("Player"));
			
			var testEnemyA:EntityBattleCharacter = new EntityBattleCharacter("Slow?");
			var testEnemyB:EntityBattleCharacter = new EntityBattleCharacter("Medium?");
			var testEnemyC:EntityBattleCharacter = new EntityBattleCharacter("Fast?");
			testEnemyA.stats.speed.current = 1;
			testEnemyB.stats.speed.current = 50;
			testEnemyC.stats.speed.current = 100;
			addEnemies([testEnemyA, testEnemyB, testEnemyC]);
			_turnManager = new ConditionalTurnManager ();
			Crux.control.dispatchEvent(new UIEvent(UIEvent.BATTLE_SETUP, this));
			startBattle();
		}
		
		public function addEnemies($array:Array):void 
		{
			for each (var item:EntityBattleCharacter in $array) {
				addEnemy(item);
			}
		}
		
		private function init():void 
		{
			_characters = new Vector.<EntityBattleCharacter> ();
			_teamAlly = new Vector.<EntityBattleCharacter> ();
			_teamEnemy = new Vector.<EntityBattleCharacter> ();
			
		}
		
		private function startBattle():void {
			_turnManager.setBattle(this);
			_turnManager.updateTurns();
			var battleTurn:ConditionalTurn = _turnManager.getNextTurn();
			startTurn(battleTurn);
		}
		
		private function startTurn(battleTurn:ConditionalTurn):void 
		{
			battleTurn.start();
		}
		
		public function getTeam($character:EntityBattleCharacter):Vector.<EntityBattleCharacter> {
			if (_teamAlly.indexOf($character) != -1) {
				return _teamAlly;
			}
			if (_teamEnemy.indexOf($character) != -1) {
				return _teamEnemy;
			}
			return null;
		}
		
		public function addAlly($character:EntityBattleCharacter):void {
			
			_teamAlly.push($character);
			addCharacter($character);
		}
		
		public function addEnemy($character:EntityBattleCharacter):void {
			
			_teamEnemy.push($character);
			addCharacter($character);
		}
		
		public function addCharacter($character:EntityBattleCharacter):void {
			_characters.push($character);
			$character.onAddedToBattle(this);
		}
		
		public function get teamAlly():Vector.<EntityBattleCharacter> 
		{
			return _teamAlly;
		}
		
		public function get teamEnemy():Vector.<EntityBattleCharacter> 
		{
			return _teamEnemy;
		}
		
		public function get characters():Vector.<EntityBattleCharacter> 
		{
			return _characters;
		}
		
	}

}