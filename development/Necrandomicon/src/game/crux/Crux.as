package game.crux 
{
	import feathers.controls.ScreenNavigator;
	import feathers.themes.MetalWorksMobileTheme;
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class Crux 
	{
		
		private static var _control:Control;
		private static var _screens:ScreenNavigator;
		
		private static var _initOnce:Boolean;
		
		public function Crux() 
		{
		
		}
		
		static public function init ():void {
			
			if (_initOnce) return;
			_initOnce = true;
			_control = new Control ();
			_screens = new ScreenNavigator ();
		}
		
		static public function get control():Control 
		{
			return _control;
		}
		
		static public function get screens():ScreenNavigator 
		{
			return _screens;
		}
		
	}

}