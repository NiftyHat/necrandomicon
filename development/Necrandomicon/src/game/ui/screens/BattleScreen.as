package game.ui.screens 
{
	import engine.battle.BattleEncounter;
	import engine.battle.events.UIEvent;
	import engine.entities.EntityBattleCharacter;
	import feathers.controls.Panel;
	import feathers.controls.Screen;
	import feathers.layout.HorizontalLayout;
	import game.ui.screens.components.BattleCharacterDetailsPanel;
	import game.ui.screens.components.BattleCharacterPanel;
	import game.ui.screens.components.BattleTeamPanel;
	import starling.core.Starling;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class BattleScreen extends Screen 
	{
		private var _battle:BattleEncounter;
		private var _enemyPanel:Panel;
		private var _detailsPanel:BattleCharacterDetailsPanel;
		
		public function BattleScreen() 
		{
			super();
			addEventListener(UIEvent.BATTLE_SETUP, onBattleSetup);
			_enemyPanel = new BattleTeamPanel ();
			_detailsPanel = new BattleCharacterDetailsPanel ();
			_detailsPanel.x = Starling.current.stage.stageWidth - 200;
			addChild(_detailsPanel);
			addChild(_enemyPanel);
			
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			_battle = new BattleEncounter ();
			
			var layout:HorizontalLayout = new HorizontalLayout ();
			_enemyPanel.layout = layout;
			layout.gap = 10;
			for each (var character:EntityBattleCharacter in _battle.teamEnemy) {
				var panel:BattleCharacterPanel = new BattleCharacterPanel ();
				panel.setCharacter(character);
				_enemyPanel.addChild(panel);
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