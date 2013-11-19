package feathers.themes 
{
	import feathers.controls.Panel;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.display.Scale9Image;
	import game.ui.screens.components.BattleActionDisplay;
	import game.ui.screens.components.BattleActionSelect;
	import game.ui.screens.components.BattleCharacterDetailsPanel;
	import game.ui.screens.components.BattleCharacterPanel;
	import game.ui.screens.components.BattleHighlightOverlay;
	import game.ui.screens.components.BattleTurnOrderList;
	import starling.display.DisplayObjectContainer;
	
	/**
	 * ...
	 * @author Duncan Saunders
	 */
	public class NecrandomiconTheme extends MetalWorksMobileTheme 
	{
		
		public function NecrandomiconTheme(container:DisplayObjectContainer=null, scaleToDPI:Boolean=true) 
		{
			super(container, scaleToDPI);
			
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			this.setInitializerForClass(BattleCharacterPanel, panelInitializer);
			this.setInitializerForClass(BattleCharacterDetailsPanel, panelInitializer);
			this.setInitializerForClass(BattleActionSelect, panelInitializer);
			this.setInitializerForClass(BattleActionDisplay , itemRendererInitializer);
			this.setInitializerForClass(BattleTurnOrderList, listInitializer);
			//this.setInitializerForClass(BattleHighlightOverlay, highlightOverlayInitlize)
		}
		
		
		
	}

}