package  
{
	import feathers.controls.Button;
	import game.spells.IconBuilder;
	import game.spells.IconObject;
	import starling.display.Sprite;
	import starling.events.Event;
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
			
		}
		

	}

}