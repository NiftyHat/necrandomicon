package game.spells.interfaces 
{
	import game.spells.ISpellScope;
	
	/**
	 * ...
	 * @author KEvans
	 */
	public interface ISpell 
	{
		function get level():uint;
		function get speed():uint;
		function get charges():uint;
		function get scope():Vector.<ISpellScope>;
		
		
	}
	
}