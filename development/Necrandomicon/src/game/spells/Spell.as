package game.spells 
{
	import game.spells.interfaces.ISpell;
	/**
	 * ...
	 * @author KEvans
	 */
	public class Spell implements ISpell
	{
		
		private var _speed:uint = 1
		private var _level:uint = 0
		private var _charges:uint = 0
		private var _scope:String = SpellConstants.NOONE;
		
		public function Spell() 
		{
			
		}
		
		
		public function get speed():uint {return _speed;}
		public function get level():uint {return _level;}
		public function get charges():uint {return _charges;}
		public function get scope():String { return _scope;}
		
		
		
		
		
	}

}