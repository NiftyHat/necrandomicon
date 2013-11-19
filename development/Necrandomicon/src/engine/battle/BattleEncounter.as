package engine.battle 
{
	import engine.battle.events.BattleTurnEvent;
	import engine.battle.events.UIEvent;
	import engine.battle.turns.BattleTurn;
	import engine.battle.turns.ConditionalTurn;
	import engine.battle.turns.ConditionalTurnManager;
	import engine.entities.EntityBattleCharacter;
	import flash.events.EventDispatcher;
	import game.crux.Crux;
	import game.spells.constants.SpellTargetConstants;
	import starling.core.Starling;
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
			Crux.control.addEventListener(BattleTurnEvent.ACTION_SELECTED, onActionSelected)
			Crux.control.addEventListener(BattleTurnEvent.COMMIT_ACTION, onCommitAction);
			startBattle();
		}
		
		private function onCommitAction(e:BattleTurnEvent):void 
		{
			var turn:BattleTurn = e.turn;
			turn.action.execute(turn.targets);
			Starling.juggler.delayCall(advanceToNextTurn, 0.5);
		}
		
		private function onActionSelected(e:BattleTurnEvent):void 
		{
			var turn:BattleTurn = e.turn;
			var targetScope:String = e.turn.action.targetScope;
			var selectionScope:String = e.turn.action.selectionScope;
			var targetList:Vector.<EntityBattleCharacter> = new Vector.<EntityBattleCharacter> ();
			switch (selectionScope) {
				default:
				case BattleAction.SCOPE_ANY:
					targetList = _characters.slice();
					break;
				case BattleAction.SCOPE_ALLY:
					targetList = _teamAlly.slice();
					break;
				case BattleAction.SCOPE_ENEMY:
					targetList = _teamEnemy.slice();
					break;
				case BattleAction.SCOPE_SELF:
					targetList.push(turn.character);
					break;
			}
			turn.possibleTargets = targetList;
			Crux.control.dispatchEvent(new BattleTurnEvent(BattleTurnEvent.TARGET_SELECTION, turn));
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
			
			advanceToNextTurn();
		}
		
		private function advanceToNextTurn():void {
			_turnManager.removeFirstTurn();
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
		
		public function getOpposingTeam($character:EntityBattleCharacter):Vector.<EntityBattleCharacter> {
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