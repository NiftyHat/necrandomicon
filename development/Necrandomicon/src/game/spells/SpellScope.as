package game.spells 
{
	import game.spells.constants.SpellAnimationConstants;
	import game.spells.constants.SpellTargetConstants;
	import game.spells.interfaces.ISpellScope;
	/**
	 * ...
	 * @author KEvans
	 */
	public class SpellScope implements ISpellScope
	{
		
		public function SpellScope() 
		{
			
		}
		
		/* INTERFACE game.spells.interfaces.ISpellScope */
		
		private var _spellType:String = "";
		private var _elements:Vector.<SpellEffectVO> =new Vector.<SpellEffectVO>()
		private var _target:String = "";
		private var _animation:String = "";
		
		private var _speedModification:int = 0;
		private var _power:int = 0;
		
		public function get spellType():String 
		{
			return _spellType;
		}
		
		public function set spellType(value:String):void 
		{
			_spellType = value;
		}
		
		public function get elements():Vector.<SpellEffectVO> 
		{
			return _elements;
		}
		
		public function set elements(value:Vector.<SpellEffectVO>):void 
		{
			_elements = value;
		}
		
		public function get target():String 
		{
			return _target;
		}
		
		public function set target(value:String):void 
		{
			_target = value;
		}
		
		public function get animation():String 
		{
			return _animation;
		}
		
		public function set animation(value:String):void 
		{
			_animation = value;
		}
		
		public function get speedModification():int 
		{
			return _speedModification;
		}
		
		public function set speedModification(value:int):void 
		{
			_speedModification = value;
		}
		
		public function get power():int 
		{
			return _power;
		}
		
		public function set power(value:int):void 
		{
			_power = value;
		}
		
		public function toString():String {
			var rStr = target + "\t" + _spellType;
			for (var i:int = 0; i < elements.length; i++) {
				rStr += "\t\t" + elements[i].element + "\t" + _elements[i].elementEffect;
			}
			return rStr;
		}
		
	}

}