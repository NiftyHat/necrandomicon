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
		private var _scope:Vector.<ISpellScope> = new Vector.<ISpellScope>();
		
		private var _color1:int;
		private var _color2:int;
		private var _color3:int;
		private var _icon:String;
		
		public function Spell() 
		{
			
		}
		
		
		public function get speed():uint {return _speed;}
		public function get level():uint {return _level;}
		public function get charges():uint {return _charges;}
		public function get scope():Vector.<ISpellScope> { return _scope;}
		
		public function get color1():int { return _color1; }
		public function get color2():int { return _color2; }
		public function get color3():int { return _color3; }
		public function get icon():String { return _icon; }
		
		
		
		
		
		
	}

}