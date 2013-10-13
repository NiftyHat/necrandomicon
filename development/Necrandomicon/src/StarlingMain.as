package  
{
	import feathers.controls.Button;
	import feathers.themes.MetalWorksMobileTheme;
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
			new MetalWorksMobileTheme ();
			initButton();
		}
		
		public function initButton():void {
			_button = new Button ();
			_button.label = "Click Me!";
			_button.validate();
			_button.x = (stage.stageWidth - _button.width) / 2;
			_button.y = (stage.stageHeight - _button.height) / 2;
			addChild(_button);
		}
		
	}

}