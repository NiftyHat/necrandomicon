package game.ui.screens 
{
	import feathers.controls.Screen;
	import game.spells.IconBuilder;
	import game.spells.MagicEngine;
	import game.spells.Spell;
	
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class SpellScreen extends Screen 
	{
		
		public function SpellScreen() 
		{
			super();
			var MERLIN:MagicEngine = MagicEngine.getInstance();
			var MORGANA:IconBuilder = IconBuilder.getInstance();
			
			var ICONLIBRARY:Vector.<String> = MORGANA.getAllIDs()
			
			for (var i:int = 0; i < 100; i++){
				var spl:Spell = MERLIN.generateSpell(MORGANA.getIconByID(ICONLIBRARY[int(ICONLIBRARY.length * Math.random())]), 0)
				trace(spl.toString());
			}
		}
		
	}

}