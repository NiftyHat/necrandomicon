package ui.spells 
{
	import feathers.controls.Button;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author Duncan Saunders
	 */
	public class SpellPanel extends Sprite
	{
		
		protected var _btn_use:Button;
		
		public function SpellPanel() 
		{
			_btn_use = new Button ();
			_btn_use.defaultIcon = new Image ();
		}
		
	}

}