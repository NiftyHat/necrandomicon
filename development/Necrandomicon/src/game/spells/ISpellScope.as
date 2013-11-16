package game.spells 
{
	
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
		 */function get effects():Vector.<SpellEffectVO>;
		
		/**
		 * Animations: Defined as per SpellAnimationConstants
		 */function get animation():String;
		
		/**
		 * Modification this effect makes to the Battlewheel
		 */function get speedModification():int;
		
		/**
		 * Power Rating of this Spell Scope
		 */function get power():int;
	}
	
}