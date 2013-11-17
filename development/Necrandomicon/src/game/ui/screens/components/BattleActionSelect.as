package game.ui.screens.components 
{
	import engine.battle.BattleAction;
	import engine.entities.EntityBattleCharacter;
	import feathers.controls.Panel;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.TiledColumnsLayout;
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class BattleActionSelect extends Panel
	{
		
		protected var _selectedAction:BattleAction;
		
		public function BattleActionSelect() 
		{
			super();
			y =200
			minHeight = 420;
			minWidth = 1024 * 0.7;
			headerProperties.title = "Battle Actions";
			var colsLayout:TiledColumnsLayout = new TiledColumnsLayout ();
			colsLayout.useSquareTiles = false;
			colsLayout.horizontalAlign = TiledColumnsLayout.HORIZONTAL_ALIGN_LEFT;
			colsLayout.gap = 3;
			//layout.horizontalAlign = TiledColumnsLayout.HORIZONTAL_ALIGN_LEFT;
			layout = colsLayout;
		}
		
		public function setCharacter($character:EntityBattleCharacter):void {
			for each (var action:BattleAction in $character.actions) {
				var actionDisplay:BattleActionDisplay = new BattleActionDisplay ();
				//actionDisplay.width = 100;
				//actionDisplay.height = 60;
				actionDisplay.setAction(action);
				addChild(actionDisplay);
			}
		}
		
		override protected function initialize():void 
		{
			super.initialize();
		}
		
	}

}