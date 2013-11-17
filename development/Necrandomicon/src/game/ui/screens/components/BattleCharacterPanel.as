package game.ui.screens.components 
{
	import engine.entities.EntityBattleCharacter;
	import feathers.controls.Header;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.Panel;
	import feathers.core.IFeathersControl;
	import feathers.display.Scale9Image;
	import feathers.themes.MetalWorksMobileTheme;
	import flash.text.TextFormat;
	import game.crux.Crux;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class BattleCharacterPanel extends Panel implements IFeathersControl 
	{
		private var _health:BattleStatDisplay;
		private var _speed:BattleStatDisplay;
		private var _offense:BattleStatDisplay;
		private var _defense:BattleStatDisplay;
		private var _character:EntityBattleCharacter;
		
		public function BattleCharacterPanel() 
		{
			
			super();
			headerFactory = function():Header
			{
				var header:Header = new Header();
				header.maxHeight = 34 * Starling.contentScaleFactor;
				return header
			}
			minHeight = 100;
			minWidth = 180;
			
			//_backgroundDisabledSkin = new Image( disabledTextures );
			_health = new BattleStatDisplay ();
			addEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		private function onTouch(e:TouchEvent):void 
		{
			if (e.touches[0].phase == TouchPhase.ENDED) {
				dispatchEvent(new Event(Event.SELECT));
			}
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			addChild(_health);
		}
		
		public function setCharacter($character:EntityBattleCharacter):void {
			
			_character = $character;
			headerProperties.title = $character.name;
			_health.setStat($character.stats.health);
		}
		
		public function get character():EntityBattleCharacter 
		{
			return _character;
		}
		
		
		
	}

}