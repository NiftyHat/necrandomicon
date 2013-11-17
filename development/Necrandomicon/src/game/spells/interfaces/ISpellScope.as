package game.spells.interfaces 
{
	import game.spells.SpellEffectVO;
	
	/**
	 * ...
	 * @author KEvans
	 */
	public interface ISpellScope 
	{
		/**
		 * Target: Defined as per SpellTargetConstants
		 */
		function get target():String;
		
		/**
		 * Effects: Spell Effects (Type/Element/Element Effect Combinations)
		 */function get elements():Vector.<SpellEffectVO>;
		
		/**
		 * Animations: Defined as per SpellAnimationConstants
		 */function get animation():String;
		
		/**
		 * Modification this effect makes to the Battlewheel
		 */function get speedModification():int;
		
		/**
		 * Power Rating of this Spell Scope
		 */function get power():int;
		 
		 /**
		  * Spell Type (Heal, Damage, etc) as defined by SpellEffectConstants
		  */function get spellType():String
		
	}
	
}