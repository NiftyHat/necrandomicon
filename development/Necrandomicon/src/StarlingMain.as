package  
{
	import feathers.controls.Button;
	import feathers.themes.MetalWorksMobileTheme;
	import game.spells.Spell;
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
		
		public function StarlingMain() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			new Spell()
		}
		

	}

}