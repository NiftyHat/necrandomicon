package game.ui.screens.components 
{
	import engine.battle.BattleAction;
	import engine.battle.events.BattleTurnEvent;
	import engine.battle.events.UIEvent;
	import engine.battle.turns.BattleTurn;
	import engine.entities.EntityBattleCharacter;
	import feathers.controls.Button;
	import feathers.controls.Callout;
	import feathers.controls.Label;
	import feathers.controls.LayoutGroup;
	import feathers.controls.Panel;
	import feathers.controls.ScrollContainer;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.TiledColumnsLayout;
	import feathers.layout.TiledRowsLayout;
	import game.crux.Crux;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class BattleActionSelect extends Panel
	{
		private var _actionButtons:Vector.<BattleActionDisplay>;
		
		protected var _selectedAction:BattleAction;
		protected var _confirmButton:Button;
		protected var _turn:BattleTurn;
		protected var _layoutActions:ScrollContainer;
		protected var _targetScope:Callout;
		protected var _targetLabel:Label;
		
		public function BattleActionSelect() 
		{
			super();
			y =180
			minHeight = 480;
			maxWidth = 1024 * 0.7;
			_actionButtons = new Vector.<BattleActionDisplay> ();
			var colsLayout:TiledColumnsLayout = new TiledColumnsLayout ();
			colsLayout.useSquareTiles = false;
			colsLayout.horizontalAlign = TiledColumnsLayout.HORIZONTAL_ALIGN_LEFT;
			colsLayout.verticalAlign = TiledColumnsLayout.VERTICAL_ALIGN_TOP;
			//colsLayout
			//colsLayout.tileHorizontalAlign = TiledColumnsLayout.TILE_HORIZONTAL_ALIGN_LEFT;
			//colsLayout.horizontalAlign = TiledColumnsLayout.HORIZONTAL_ALIGN_LEFT
			colsLayout.gap = 1;
			//colsLayout.paging = TiledRowsLayout.PAGING_VERTICAL;
			_layoutActions = new ScrollContainer ();
			_layoutActions.scrollBarDisplayMode = SCROLL_BAR_DISPLAY_MODE_FIXED;
			_layoutActions.interactionMode = INTERACTION_MODE_MOUSE;
			_layoutActions.y = 70;
			_layoutActions.maxHeight = 420;
			_layoutActions.minWidth = 420;
			_layoutActions.layout = colsLayout;
		
			
			_confirmButton = new Button ();
			_confirmButton.label = "Commit";
			_confirmButton.isEnabled = false;
			_confirmButton.addEventListener(Event.TRIGGERED, onConfirmButtonTriggered);
			//layout.horizontalAlign = TiledColumnsLayout.HORIZONTAL_ALIGN_LEFT;
			//layout = colsLayout;
			Crux.control.addEventListener(UIEvent.TARGET_SELECT_PROMPT, onTargetSelectPrompt);
			Crux.control.addEventListener(BattleTurnEvent.WAIT_FOR_COMMIT, onWaitForCommit);
		}
		
		private function onTargetSelectPrompt(e:UIEvent):void 
		{
			headerProperties.title = " Select Targets!";
		}
		
		override protected function initialize():void 
		{
			
			super.initialize();
			addChild(_confirmButton);
			addChild(_layoutActions);
		}
		
		private function onConfirmButtonTriggered(e:Event):void 
		{
			Crux.control.dispatchEvent(new BattleTurnEvent(BattleTurnEvent.COMMIT_ACTION, _turn));
			Crux.control.removeEventListener(BattleTurnEvent.WAIT_FOR_COMMIT, onWaitForCommit);
			removeFromParent();
		}
		
		private function onWaitForCommit(e:BattleTurnEvent):void 
		{
			//_confirmButton.isEnabled = true;
			if (_selectedAction) {
				_confirmButton.isEnabled = true;
			}
		}
		
		
		protected function setCharacter($character:EntityBattleCharacter):void {
			for each (var action:BattleAction in $character.actions) {
				var actionDisplay:BattleActionDisplay = new BattleActionDisplay ();
				//actionDisplay.width = 100;
				//actionDisplay.height = 60;
				actionDisplay.removeEventListeners();
				actionDisplay.addEventListener(Event.TRIGGERED, onActionSelected); 
				//actionDisplay.addChild(
				actionDisplay.setAction(action);
				_layoutActions.addChild(actionDisplay);
				_actionButtons.push(actionDisplay);
			}
			headerProperties.title = $character.name + " Actions";
			
		}
		
		
		private function onActionSelected(e:Event):void 
		{
			
			clearSelection();
			var actionDisplay:BattleActionDisplay = e.target as BattleActionDisplay;
			actionDisplay.action.owner = _turn.character;
			actionDisplay.isSelected = true;
			_turn.setAction(actionDisplay.action);
			_selectedAction = actionDisplay.action;
			Crux.control.dispatchEvent(new BattleTurnEvent(BattleTurnEvent.ACTION_SELECTED, _turn));
		}
		
		private function clearSelection():void 
		{
			_confirmButton.isEnabled = false;
			//alpha = 1.0;
			for each (var item:BattleActionDisplay in _actionButtons) {
				item.isSelected = false;
			}
		}
		
		public function setTurn($battleTurn:BattleTurn):void 
		{
			_turn = $battleTurn;
			setCharacter(_turn.character);
		}
		
	}

}