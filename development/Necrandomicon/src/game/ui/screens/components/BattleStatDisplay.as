package game.ui.screens.components 
{
	import engine.statistics.Stat;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.FeathersControl;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import starling.core.Starling;
	import starling.display.Quad;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class BattleStatDisplay extends Sprite 
	{
		
		private var _name:Label;
		private var _value:Label;
		private var _bar:ProgressBar;
		
		public function BattleStatDisplay() 
		{
			super();
			_name = new Label;
			_value = new Label;
			_bar = new ProgressBar ();
			
		}
		
		public function update($current:Number, $max:Number) {
			_bar.maximum = $max;
			Starling.juggler.tween(_bar, 0.3, { value:$current } );
			_value.text = $current + "/" + $max;
		}
		

		public function setStat($stat:Stat):void {
			var _stat:Stat = $stat;
			_name.text = $stat.id;
			_value.textRendererProperties.format = new TextFormat( "Source Sans Pro", 16, 0x333333, null,null,null,null, null, TextFormatAlign.CENTER)
			_value.text = $stat.printValue;
			_bar = new ProgressBar ();
			_name.x = 0;
			_value.x = 80;
			_bar.y = 40;
			_bar.width = 150;
			_bar.height = 10;
			_bar.maximum = $stat.totalModified;
			_bar.minimum = 0;
			_bar.value = $stat.current;
			addChild(_name);
			addChild(_value);
			addChild(_bar);
			//addChild(new Quad(30, 30, 0xFF0000, true));
		}
		
	}

}