package game.spells 
{
	import game.spells.interfaces.ISpell;
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
		
		
		public function get speed():uint {return _speed;}
		public function get level():uint {return _level;}
		public function get charges():uint {return _charges;}
		public function get scope():Vector.<ISpellScope> { return _scope;}
		
		public function get color1():int { return _color1; }
		public function get color2():int { return _color2; }
		public function get color3():int { return _color3; }
		public function get icon():String { return _icon; }	//TODO: Replace this with getting the actual icon?
		
		
		public static function generateSpell(iconIn:IconObject, chaosFactor:Number):Spell
		{
			var effectTargetTypes:Vector.<ScopeVO> = new Vector.<ScopeVO>()
			var effectElementTypes:Vector.<ScopeVO>= new Vector.<ScopeVO>()
			var effectElementEffectTypes:Vector.<ScopeVO>= new Vector.<ScopeVO>()
			var effectSpellEffectTypes:Vector.<ScopeVO>= new Vector.<ScopeVO>()
			
			var i:int, j:int;
			
			// Build a dictionary of terms to use based on the icon
			for (i = 0; i < icon.terms.length; i++) {
				switch(iconIn.iconOperations[i].scopeType) {
					
					case ScopeVO.TARGET:
						for (j = 0; j < icon.weighting[i]; j++) {
							effectTargetTypes.push(icon.iconOperations[i]);
						} break;
					case ScopeVO.ELEMENT_TYPE:
						for (j = 0; j < icon.weighting[i]; j++) {
							effectElementTypes.push(icon.iconOperations[i]);
						} break;
					case ScopeVO.ELEMENT_EFFECT:
						for (j = 0; j < icon.weighting[i]; j++) {
							effectElementEffectTypes.push(icon.iconOperations[i]);
						} break;
					case ScopeVO.SPELL_EFFECT:
						for (j = 0; j < icon.weighting[i]; j++) {
							effectSpellEffectTypes.push(icon.iconOperations[i]);
						} break;
				}
			}
			
			var scopeArrays:Vector.<ISpellScope> = new Vector.<ISpellScope>();
			
			
			
			var color1:int = Math.random() * 0xffffff //TODO: Generate Color based on terms?
			var color2:int = Math.random() * 0xffffff //As above
			var color3:int = Math.random() * 0xffffff //As above
			
			
			return new Spell(generateName(), scopeArrays, iconIn.iconImage, color1, color2, color3)
		}
		
		static public function generateName():void 
		{
			return "Generic Spell Name"; //TODO: Make a fun name generator
		}
		
		
		
	}

}