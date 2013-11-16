package game.spells.constants 
{
	/**
	 * ...
	 * @author Keith Evans @ heatknives.com
	 */
	public class SpellElementEffectConstants 
	{
		
		/** Element will be HEALED by effect (x -1 Damage, Anti Effect for Status) */public static const HEALS_ELEMENT:String = "spell::effect::healsElement";
		/** Element will be NOT EFECTED by effect (x 0 Damage, x0 Chance for Status) */public static const NO_EFFECT_ELEMENT:String = "spell::effect::noEffectElement";
		/** Element is resistant to this effect (x 0.5 Damage, Half Chance for Status) */public static const ELEMENT_IS_RESISTANT:String = "spell::effect::elementResistant";
		/** Element is susceptible to damage by this effect (x 2 Damage, Double Chance for Status) */public static const ELEMENT_IS_WEAK_TO:String = "spell::effect::elementIsWeakTo";
		/** Element will suffer maximum damage from this effect and instantly die (=int.MAX_VALUE for Damage, Chance of applicable Status Effect = 1) */public static const ELEMENT_SUFFERS_INSTANT_DEATH:String = "spell::effect::instantDeath";
		
		/** ONLY specified element will suffer effects of this spell (if NOT element, Damage = 0, Status = 1 if Element, 0 otherwise) */public static const ONLY_EFFECTS_ELEMENT:String = "spell::effect::onlyEffectsElement";
	}

}