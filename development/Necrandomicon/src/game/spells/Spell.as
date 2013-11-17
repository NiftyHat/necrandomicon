package game.spells 
{
	import game.spells.interfaces.ISpell;
	import game.spells.interfaces.ISpellScope;
	/**
	 * ...
	 * @author KEvans
	 */
	public class Spell implements ISpell
	{
		
		protected var _speed:uint = 1
		protected var _level:uint = 0
		protected var _charges:uint = 0
		protected var _scope:Vector.<ISpellScope> = new Vector.<ISpellScope>();
		
		protected var _color1:int;
		protected var _color2:int;
		protected var _color3:int;
		protected var _icon:String;
		
		protected var _name:String;
		
		public function Spell(name:String, scope:Vector.<ISpellScope>, icon:String, color1:int, color2:int, color3:int) 
		{
			
			_name = name;
			
			_scope = scope.slice();
			_icon = icon;
			
			_color1 = color1;
			_color2 = color2;
			_color3 = color3;
			
		}
		
		/* INTERFACE game.spells.interfaces.ISpell */
		
		public function get iconName():String {return _name;}
		
		
		public function get speed():uint {return _speed;}
		public function get level():uint {return _level;}
		public function get charges():uint {return _charges;}
		public function get scope():Vector.<ISpellScope> { return _scope;}
		
		public function get color1():int { return _color1; }
		public function get color2():int { return _color2; }
		public function get color3():int { return _color3; }
		public function get icon():String { return _icon; }	//TODO: Replace this with getting the actual icon?
		
		public function toString():String {
			var rStr = _name.toUpperCase() + " | ";
			for (var i:int = 0; i < scope.length; i++) {
				rStr+=(i + ": " + scope[i]+" \r");
			}
			return rStr;
		}
		
	}

}