package game.ui.screens 
{
	import engine.battle.BattleAction;
	import engine.battle.BattleEncounter;
	import engine.battle.events.BattleCharacterEvent;
	import engine.battle.events.BattleTurnEvent;
	import engine.battle.events.UIEvent;
	import engine.battle.turns.BattleTurn;
	import engine.entities.EntityBattleCharacter;
	import feathers.controls.LayoutGroup;
	import feathers.controls.Panel;
	import feathers.controls.PanelScreen;
	import feathers.controls.Screen;
	import feathers.layout.AnchorLayout;
	import feathers.layout.HorizontalLayout;
	import flash.utils.Dictionary;
	import game.crux.Crux;
	import game.ui.screens.components.BattleActionDisplay;
	import game.ui.screens.components.BattleActionSelect;
	import game.ui.screens.components.BattleCharacterDetailsPanel;
	import game.ui.screens.components.BattleCharacterPanel;
	import game.ui.screens.components.BattleTeamPanel;
	import starling.core.Starling;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class BattleScreen extends LayoutGroup 
	{
		private var _battle:BattleEncounter;
		private var _enemyPanel:Panel;
		private var _allyPanel:Panel;
		private var _detailsPanel:BattleCharacterDetailsPanel;
		private var _anchorLayout:AnchorLayout;
		private var _battleTurn:BattleTurn;
		private var _isSelectionMode:Boolean;
		
		private var _dictCharacterPanels = new Dictionary ();
		
		public function BattleScreen() 
		{
			super();
			addEventListener(UIEvent.BATTLE_SETUP, onBattleSetup);
			_enemyPanel = new BattleTeamPanel ();
			_allyPanel = new BattleTeamPanel ();
			_allyPanel.y = Starling.current.stage.stageHeight - _allyPanel.minHeight;
			_detailsPanel = new BattleCharacterDetailsPanel ();
			_detailsPanel.x = Starling.current.stage.stageWidth - 200;
			_anchorLayout = new AnchorLayout ();
			layout = _anchorLayout;
			addChild(_detailsPanel);
			addChild(_enemyPanel);
			addChild(_allyPanel);
			addListeners();
		}
		
		private function addListeners():void 
		{
			Crux.control.addEventListener(BattleTurnEvent.START, onTurnStart);
			Crux.control.addEventListener(BattleTurnEvent.TARGET_SELECTION, onTargetSelection);
			Crux.control.addEventListener(BattleTurnEvent.COMMIT_ACTION, onCommitAction);
		}
		
		private function onCommitAction(e:BattleTurnEvent):void 
		{
			_isSelectionMode = false;
			clearSelection();
		}
		
		private function onTargetSelection(e:BattleTurnEvent):void 
		{
			var turn:BattleTurn = e.turn;
			var targetScope:String = turn.action.selectionScope;
			var list:Vector.<EntityBattleCharacter> = new Vector.<EntityBattleCharacter> ()
			switch (targetScope) {
				case BattleAction.SCOPE_SELF:
					list.push(turn.action.owner); 
					turn.targets = list;
					endSelection();
					break;
				case null:
					endSelection();
				break;
				default:
					_isSelectionMode = true;
				break;
				//case BattleAction.SC
			}
		}
		
		private function onTurnStart(e:BattleTurnEvent):void 
		{
			_battleTurn = e.turn;
			var selector:BattleActionSelect = new BattleActionSelect ();
			selector.setTurn(_battleTurn);
			addChild(selector);
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			_battle = new BattleEncounter ();
			
			
			for each (var character:EntityBattleCharacter in _battle.teamEnemy) {
				var panel:BattleCharacterPanel = new BattleCharacterPanel ();
				panel.setCharacter(character);
				_enemyPanel.addChild(panel);
				_dictCharacterPanels[character] = panel;
				panel.addEventListener(Event.SELECT, onSelectCharacter);
			}
			
			for each (var character:EntityBattleCharacter in _battle.teamAlly) {
				var panel:BattleCharacterPanel = new BattleCharacterPanel ();
				panel.setCharacter(character);
				_allyPanel.addChild(panel);
				_dictCharacterPanels[character] = panel;
				panel.addEventListener(Event.SELECT, onSelectCharacter);
			}
			//addChild(_enemyPanel);
		}
		
		private function onSelectCharacter(e:Event):void 
		{
			var panel:BattleCharacterPanel = e.target as BattleCharacterPanel;
			var char:EntityBattleCharacter = panel.character;
			var list:Vector.<EntityBattleCharacter>;
			_detailsPanel.setCharacter(char);
			clearSelection();
			if (_isSelectionMode) {
				if (_battleTurn.possibleTargets.indexOf(char) != -1) {
					if (_battleTurn.action.targetScope == BattleAction.TARGET_TEAM) {
						var team:Vector.<EntityBattleCharacter> = _battle.getTeam(char)
						for each (var teamChar:EntityBattleCharacter in team) {
							selectCharacter(teamChar);
							list = team;
						}
					}
					if (_battleTurn.action.targetScope == BattleAction.TARGET_SINGLE) {
						selectCharacter(char);
						list = new Vector.<EntityBattleCharacter> ();
						list.push(char);
						
					}
				}
			}
			_battleTurn.targets = list;
			endSelection();
		}
		
		private function clearSelection():void 
		{
			for each (var panel:BattleCharacterPanel in _dictCharacterPanels) {
				//var panel:BattleCharacterPanel = _dictCharacterPanels[character];
				if (panel) panel.unselectedAsTarget();
			}
		}
		
		private function endSelection():void 
		{
			Crux.control.dispatchEvent(new BattleTurnEvent(BattleTurnEvent.WAIT_FOR_COMMIT, _battleTurn));
		}
		

		
		private function selectCharacter(char:EntityBattleCharacter):void 
		{
			var panel:BattleCharacterPanel = _dictCharacterPanels[char];
			panel.selectedAsTarget();
		}
		
		private function onBattleSetup(e:UIEvent):void 
		{
			_battle = e.data as BattleEncounter;
			
		}
		
	}

}