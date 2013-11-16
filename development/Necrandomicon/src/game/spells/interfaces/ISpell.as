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
		
		function get color1():int;
		function get color2():int;
		function get color3():int;
		
		function get iconName():String
		
	}
	
}