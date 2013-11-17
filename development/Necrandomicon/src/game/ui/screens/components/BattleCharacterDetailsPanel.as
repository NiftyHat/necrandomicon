package game.ui.screens.components 
{
	import engine.entities.EntityBattleCharacter;
	import feathers.controls.Header;
	import feathers.controls.Panel;
	import feathers.layout.VerticalLayout;
	import starling.core.Starling;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class BattleCharacterDetailsPanel extends Panel 
	{
		private var _health:BattleStatDisplay;
		private var _speed:BattleStatDisplay;
		private var _offense:BattleStatDisplay;
		private var _defense:BattleStatDisplay;
		private var _character:EntityBattleCharacter;
		
		public function BattleCharacterDetailsPanel() 
		{
			
			super();
			headerFactory = function():Header
			{
				var header:Header = new Header();
				header.maxHeight = 34 * Starling.contentScaleFactor;
				return header
			}
			minHeight = 300;
			minWidth = 200;
			padding = 3;
			layout = new VerticalLayout ();
			//_backgroundDisabledSkin = new Image( disabledTextures );
			_health = new BattleStatDisplay ();
			_speed = new BattleStatDisplay ();
			_defense = new BattleStatDisplay ();
			_offense = new BattleStatDisplay ();
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			addChild(_health);
			addChild(_speed);
			addChild(_defense);
			addChild(_offense);
		}
		
		public function setCharacter($character:EntityBattleCharacter):void {
			
			_character = $character;
			headerProperties.title = $character.name;
			_health.setStat($character.stats.health);
			_speed.setStat($character.stats.speed);
			_offense.setStat($character.stats.offense);
			_defense.setStat($character.stats.defense);
		}
		
		public function get character():EntityBattleCharacter 
		{
			return _character;
		}
		
	}

}