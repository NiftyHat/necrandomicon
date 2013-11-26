package game.ui.screens.components 
{
	import engine.battle.BattleAction;
	import feathers.controls.Callout;
	import feathers.controls.Label;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.textures.Scale9Textures;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.filters.BlurFilter;
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
		private var _targetLabel:Label;
		private var _isSelected:Boolean;
		
		public function BattleActionDisplay() 
		{
			super();
			
			//_targetLabel = new Label ();
			//_targetLabel.text = "Target description";
			//y = 100;
			//_value = new Label ();
			initialize();
		}
		
		protected function initialize():void 
		{
			//super.initialize();
			_icon = new Sprite ();
			_icon.addChild( new Quad (96, 96, 0xC0C0C0));
			_name = new Label ();
			_name.x = _icon.height - 96;
			_name.y = 0;
			_name.width = 96;
			_name.touchable = false;
			if (_action) _name.text = _action.name;
			
			addChild(_icon);
			addChild(_name);
			touchable = true;
			_icon.addEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		public function set isSelected($value:Boolean):void {
			_isSelected = $value;
			if (_isSelected) {
				filter = BlurFilter.createGlow(0xFFFFFF, 1.0, 0.5, 0.5);
			} else {
				filter = null;
			}
		}
		
		public function get isSelected():Boolean {
			return _isSelected
		}
		
		override public function dispose():void 
		{
			super.dispose();
			removeEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		private function onTouch(e:TouchEvent):void 
		{
			if (e.touches[0].phase == TouchPhase.ENDED) {
				dispatchEvent(new Event(Event.TRIGGERED));
			}
		}
		
		public function setAction($action:BattleAction):void 
		{
			_action = $action;
			if (_name)  _name.text = _action.name;
		}
		
		public function get action():BattleAction 
		{
			return _action;
		}
		
		
		
	}

}