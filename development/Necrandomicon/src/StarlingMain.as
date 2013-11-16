package  
{
	import engine.battle.BattleEncounter;
	import feathers.controls.Button;
	import feathers.controls.IScreen;
	import feathers.controls.ScreenNavigator;
	import feathers.controls.ScreenNavigatorItem;
	import feathers.themes.MetalWorksMobileTheme;
	import game.crux.Crux;
	import game.ui.screens.BattleScreen;
	import game.ui.screens.SpellScreen;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	/**
	 * ...
	 * @author Duncan Saunders
	 */
	public class StarlingMain extends Sprite
	{
		
		private var _button:Button;
		private var _navigator:ScreenNavigator;
		
		public function StarlingMain() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			_navigator = new ScreenNavigator ();
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			Crux.init();
			new MetalWorksMobileTheme (this, false);
			//new Spell()
			addChild(Crux.screens);
			Crux.screens.addScreen("Startup", new ScreenNavigatorItem (StartupScreen)); ;
			Crux.screens.addScreen("Spell", new ScreenNavigatorItem (SpellScreen)); ;
			Crux.screens.addScreen("Battle", new ScreenNavigatorItem (BattleScreen)); ;
			Crux.screens.showScreen("Startup");
			//addChild(new StartupScreen ());
		}
		

	}

}