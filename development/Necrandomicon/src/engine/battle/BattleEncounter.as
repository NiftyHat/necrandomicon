package engine.battle 
{
	import engine.battle.events.BattleTurnEvent;
	import engine.battle.events.UIEvent;
	import engine.battle.turns.BattleTurn;
	import engine.battle.turns.ConditionalTurn;
	import engine.battle.turns.ConditionalTurnManager;
	import engine.entities.EntityBattleCharacter;
	import engine.enums.SelectionScope;
	import engine.enums.TargetScope;
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
			var targetScope:TargetScope = e.turn.action.targetScope;
			var selectionScope:SelectionScope = e.turn.action.selectionScope;
			var modifierScope:String = e.turn.action.modifierScope;
			var targetList:Vector.<EntityBattleCharacter> = new Vector.<EntityBattleCharacter> ();
			var owner:EntityBattleCharacter = turn.action.owner;
			var ownerTeam:Vector.<EntityBattleCharacter> = getTeam(owner);
			var opposingTeam:Vector.<EntityBattleCharacter>;
			if (ownerTeam == _teamAlly) {
				opposingTeam = _teamEnemy;
			} else {
				opposingTeam = _teamAlly
			}
			
			var none:Boolean = (selectionScope == SelectionScope.NONE);
			var self:Boolean = (targetScope == TargetScope.NONE);
			var any:Boolean = (selectionScope == SelectionScope.ANY);
			var excludes_self:Boolean = (modifierScope == BattleAction.NOT_SELF);
			if (none) {
				
			}
			else if (self) {
				targetList.push(owner);
			} else {
				switch (selectionScope) {
				default:
				case SelectionScope.ANY:
					targetList = _characters.slice();
					break;
				case SelectionScope.ALLY:
					targetList = ownerTeam.slice();
					break;
				case SelectionScope.ENEMY:
					targetList = opposingTeam.slice();
				break;
				}
			}
			if (!self && excludes_self) {
				targetList.splice(targetList.indexOf(owner), 1);
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