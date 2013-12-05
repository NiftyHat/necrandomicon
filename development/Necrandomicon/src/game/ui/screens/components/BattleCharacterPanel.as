package game.ui.screens.components 
{
	import engine.battle.events.BattleCharacterEvent;
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
	import game.ui.screens.effects.EffectDamageValue;
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
	
			minHeight = 80;
			minWidth = 180;
			
			//_backgroundDisabledSkin = new Image( disabledTextures );
			Crux.control.addEventListener(BattleCharacterEvent.UPDATE_STATS, onUpdateStats);
			_health = new BattleStatDisplay ();
			addEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		override public function dispose():void 
		{
			Crux.control.removeEventListener(BattleCharacterEvent.UPDATE_STATS, onUpdateStats);
			super.dispose();
		}

		private function onUpdateStats(e:BattleCharacterEvent):void 
		{
			if (e.character == _character) {
				_health.update(_character.stats.health.current,_character.stats.health.totalModified);
			}
			
		}
		
		public function selectedAsTarget():void {
			Starling.juggler.tween(this, 0.5, { scaleX:0.9, scaleY:0.9 } );
		}
		
		public function unselectedAsTarget():void {
			Starling.juggler.tween(this, 0.5, { scaleX:1, scaleY:1 } );
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