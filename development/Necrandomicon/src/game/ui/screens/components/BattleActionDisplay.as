package game.ui.screens.components 
{
	import engine.battle.BattleAction;
	import feathers.controls.Label;
	import starling.display.Quad;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class BattleActionDisplay extends Sprite
	{
		private var _name:Label;
		private var _value:Label;
		private var _icon:Sprite;
		
		public function BattleActionDisplay() 
		{
			super();
			init();
			//y = 100;
			//_value = new Label ();
			
		}
		
		public function setAction(action:BattleAction):void 
		{
			_name.text = action.name;
		}
		
		private function init():void 
		{
			_icon = new Sprite ();
			_icon.addChild( new Quad (96, 96, 0xC0C0C0));
			_name = new Label ();
			_name.x = _icon.width + 4;;
			_name.width = 120;
			_name.text = "Action Name";
			addChild(_name);
			addChild(_icon);
		}
		
		
		
	}

}