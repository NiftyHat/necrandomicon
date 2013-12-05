package game.ui.screens.effects 
{
	import game.crux.Crux;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.utils.HAlign;
	
	/**
	 * ...
	 * @author Duncan Saunders
	 */
	public class EffectDamageValue extends Sprite 
	{
		
		protected var _tf:TextField;
		
		public function EffectDamageValue() 
		{
			_tf = new TextField (120, 30, "0", BitmapFont.MINI, 24);
			_tf.hAlign = HAlign.CENTER;
		}
		
		public function init($value:int, $color:int, $stat:String):void {
			_tf.text = $value.toString() + $stat;
			_tf.color = $color;
			addChild(_tf);
			Starling.juggler.tween(this, 0.3, { y: y - 30 } );
			Starling.juggler.tween(this, 1.0, { y: y + 100, alpha:0, delay:1.5, onComplete:removeFromParent } );
		}
		
	}

}