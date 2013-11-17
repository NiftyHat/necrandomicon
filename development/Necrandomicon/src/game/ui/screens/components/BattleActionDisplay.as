package game.ui.screens.components 
{
	import engine.battle.BattleAction;
	import engine.battle.events.BattleTurnEvent;
	import engine.battle.events.UIEvent;
	import feathers.controls.Label;
	import game.crux.Crux;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class BattleActionDisplay extends Sprite
	{
		private var _name:Label;
		private var _value:Label;
		private var _icon:Sprite;
		private var _action:BattleAction;
		
		public function BattleActionDisplay() 
		{
			super();
			init();
			addEventListener(TouchEvent.TOUCH, onTouch);
			//y = 100;
			//_value = new Label ();
			
		}
		
		override public function dispose():void 
		{
			super.dispose();
			removeEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		private function onTouch(e:TouchEvent):void 
		{
			if (e.touches[0].phase == TouchPhase.ENDED) {
				dispatchEvent(new Event(Event.SELECT));
			}
		}
		
		public function setAction($action:BattleAction):void 
		{
			_action = $action;
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
		
		public function get action():BattleAction 
		{
			return _action;
		}
		
		
		
	}

}