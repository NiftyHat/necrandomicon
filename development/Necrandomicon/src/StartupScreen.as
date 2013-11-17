package  
{
	import feathers.controls.ButtonGroup;
	import feathers.controls.List;
	import feathers.controls.PanelScreen;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.controls.Screen;
	import feathers.data.ListCollection;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.VerticalLayout;
	import game.crux.Crux;
	import game.ui.screens.BattleScreen;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class StartupScreen extends Screen 
	{
		
		var _testList:List;
		
		public function StartupScreen() 
		{
			super();
			width = 104;
			height = 768
			//layout = new VerticalLayout ();
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			var group:ButtonGroup = new ButtonGroup();
			var buttonGroupLayoutData:AnchorLayoutData = new AnchorLayoutData();
			buttonGroupLayoutData.horizontalCenter = 0;
			buttonGroupLayoutData.verticalCenter = 0;
			group.layoutData = buttonGroupLayoutData;
			addChild(group);
			group.direction = ButtonGroup.DIRECTION_HORIZONTAL
			group.dataProvider = new ListCollection(
			[
				{ label: "Spell Test", triggered: onSelectSpellTest },
				{ label: "Battle Test", triggered: onSelectBattleTest }
			]);
		}
		
		private function onSelectBattleTest():void 
		{
			Crux.screens.showScreen("Battle");
		}
		
		private function onSelectSpellTest():void 
		{
			Crux.screens.showScreen("Spell");
		}
		
	}

}