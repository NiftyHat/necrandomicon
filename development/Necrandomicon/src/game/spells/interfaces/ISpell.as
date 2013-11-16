package game.spells.interfaces 
{
	
	/**
	 * ...
	 * @author KEvans
	 */
	public interface ISpell 
	{
		function get level():uint;
		function get speed():uint;
		function get charges():uint;
		function get scope():String;
		
	}
	
}