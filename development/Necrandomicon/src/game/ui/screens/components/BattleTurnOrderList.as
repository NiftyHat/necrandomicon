package game.ui.screens.components 
{
	import engine.battle.events.BattleTurnEvent;
	import engine.battle.turns.BattleTurn;
	import engine.battle.turns.ConditionalTurn;
	import feathers.controls.List;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.data.ListCollection;
	import game.crux.Crux;
	import starling.display.Image;
	/**
	 * ...
	 * @author Duncan Saunders
	 */
	public class BattleTurnOrderList extends List
	{
		
		public function BattleTurnOrderList() 
		{
			Crux.control.addEventListener(BattleTurnEvent.START, onTurnStart); 
			_maxWidth = 200;
			_maxHeight = 500;
			itemRendererFactory = function():IListItemRenderer
			{
				var renderer:DefaultListItemRenderer = new DefaultListItemRenderer();
				renderer.maxHeight = 40;
				//renderer.defaultSkin = new Image( texture );
				//renderer.defaultLabelProperties.textFormat = new BitmapFontTextFormat( font );
				return renderer;
			}
		}
		
		private function onTurnStart(e:BattleTurnEvent):void 
		{
			var turn:BattleTurn = e.turn;
			var list:Vector.<ConditionalTurn> = e.turn.manager.turns;
			var len:int = list.length;
			var turnsList:ListCollection = new ListCollection(list);
			
			dataProvider = turnsList;
			itemRendererProperties.labelField = "characterName";
		}
		
	}

}