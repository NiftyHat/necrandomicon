package game.ui.screens.components 
{
	import feathers.controls.Header;
	import feathers.controls.Panel;
	import feathers.layout.HorizontalLayout;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class BattleTeamPanel extends Panel 
	{
		
		public function BattleTeamPanel() 
		{
			super();
			headerFactory = function():Header
			{
				var header:Header = new Header();
				header.maxHeight = 24 * Starling.contentScaleFactor;
				return header;
			}
			var layout:HorizontalLayout = new HorizontalLayout ();
			this.layout = layout;
			layout.gap = 3;
			padding = 3;
			minHeight = 160;
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			//invalidate();
		}
		
	}

}