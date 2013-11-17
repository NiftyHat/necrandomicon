package game.ui.screens 
{
	import engine.battle.BattleEncounter;
	import engine.battle.events.BattleTurnEvent;
	import engine.battle.events.UIEvent;
	import engine.battle.turns.BattleTurn;
	import engine.entities.EntityBattleCharacter;
	import feathers.controls.Panel;
	import feathers.controls.PanelScreen;
	import feathers.controls.Screen;
	import feathers.layout.AnchorLayout;
	import feathers.layout.HorizontalLayout;
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
	public class BattleScreen extends PanelScreen 
	{
		private var _battle:BattleEncounter;
		private var _enemyPanel:Panel;
		private var _allyPanel:Panel;
		private var _detailsPanel:BattleCharacterDetailsPanel;
		private var _anchorLayout:AnchorLayout;
		
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
		}
		
		private function onTurnStart(e:BattleTurnEvent):void 
		{
			var battleTurn:BattleTurn = e.turn;
			var selector:BattleActionSelect = new BattleActionSelect ();
			selector.setCharacter(battleTurn.character);
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
				panel.addEventListener(Event.SELECT, onSelectCharacter);
			}
			
			for each (var character:EntityBattleCharacter in _battle.teamAlly) {
				var panel:BattleCharacterPanel = new BattleCharacterPanel ();
				panel.setCharacter(character);
				_allyPanel.addChild(panel);
				panel.addEventListener(Event.SELECT, onSelectCharacter);
			}
			addChild(_enemyPanel);
		}
		
		private function onSelectCharacter(e:Event):void 
		{
			var panel:BattleCharacterPanel = e.target as BattleCharacterPanel;
			var char:EntityBattleCharacter = panel.character;
			_detailsPanel.setCharacter(char);
		}
		
		private function onBattleSetup(e:UIEvent):void 
		{
			_battle = e.data as BattleEncounter;
			
		}
		
	}

}