package game.ui.screens.components 
{
	import engine.battle.BattleAction;
	import engine.battle.events.BattleTurnEvent;
	import engine.battle.turns.BattleTurn;
	import engine.entities.EntityBattleCharacter;
	import feathers.controls.Button;
	import feathers.controls.Panel;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.TiledColumnsLayout;
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
		
		protected var _selectedAction:BattleAction;
		protected var _confirmButton:Button;
		protected var _turn:BattleTurn;
		
		public function BattleActionSelect() 
		{
			super();
			y =200
			minHeight = 420;
			maxWidth = 1024 * 0.7;
			
			var colsLayout:TiledColumnsLayout = new TiledColumnsLayout ();
			colsLayout.useSquareTiles = false;
			colsLayout.horizontalAlign = TiledColumnsLayout.HORIZONTAL_ALIGN_LEFT;
			colsLayout.gap = 3;
			_confirmButton = new Button ();
			_confirmButton.label = "Commit";
			_confirmButton.isEnabled = false
			_confirmButton.addEventListener(Event.TRIGGERED, onConfirmButtonTriggered);
			//layout.horizontalAlign = TiledColumnsLayout.HORIZONTAL_ALIGN_LEFT;
			
			layout = colsLayout;
			Crux.control.addEventListener(BattleTurnEvent.WAIT_FOR_COMMIT, onWaitForCommit);
		}
		
		private function onConfirmButtonTriggered(e:Event):void 
		{
			Crux.control.dispatchEvent(new BattleTurnEvent(BattleTurnEvent.COMMIT_ACTION, _turn));
			removeFromParent();
		}
		
		private function onWaitForCommit(e:BattleTurnEvent):void 
		{
			Crux.control.removeEventListener(BattleTurnEvent.WAIT_FOR_COMMIT, onWaitForCommit);
			_confirmButton.isEnabled = true;
		}
		
		
		protected function setCharacter($character:EntityBattleCharacter):void {
			for each (var action:BattleAction in $character.actions) {
				var actionDisplay:BattleActionDisplay = new BattleActionDisplay ();
				//actionDisplay.width = 100;
				//actionDisplay.height = 60;
				actionDisplay.addEventListener(Event.SELECT, onActionSelected);
				actionDisplay.setAction(action);
				addChild(actionDisplay);
			}
			headerProperties.title = $character.name + " Actions";
			addChild(_confirmButton);
		}
		
		private function onActionSelected(e:Event):void 
		{
			var actionDisplay:BattleActionDisplay = e.target as BattleActionDisplay;
			actionDisplay.action.owner = _turn.character;
			_turn.setAction(actionDisplay.action);
			Crux.control.dispatchEvent(new BattleTurnEvent(BattleTurnEvent.ACTION_SELECTED, _turn));
		}
		
		public function setTurn($battleTurn:BattleTurn):void 
		{
			_turn = $battleTurn;
			setCharacter(_turn.character);
		}
		
		override protected function initialize():void 
		{
			super.initialize();
		}
		
	}

}