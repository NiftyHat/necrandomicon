package game.spells.constants 
{
	/**
	 * ...
	 * @author KEvans
	 */
	public class SpellTargetConstants 
	{
		
		/** Effects only caster */public static const SELF:String = "spell::scope::self"
		
		/** Effects any ally to the caster of the caster's choice */public static const TARGET_ALLY:String = "spell::scope::targetAlly"
		/** Effects any selected ally to the caster, or the caster (caster's choice)*/public static const TARGET_ALLY_OR_SELF:String = "spell::scope::targetAllyOrSelf"
		/** Effects any selected enemy of the caster, caster's choice */public static const TARGET_ENEMY:String = "spell::scope::targetEnemy"
		/** Effects any participant of the battle, caster's choice */public static const TARGET_ANY:String = "spell::scope::targetAny";
		/** Effects any participant of the battle, aside from the caster, caster's choice */public static const TARGET_ANY_BAR_SELF:String = "spell::scope::targetAnyBarSelf";
		
		/** Effects a random member of the caster's side, including the caster */public static const RANDOM_ALLY_OR_SELF:String = "spell::scope::randomAllyOrSelf"
		/** Effects a random member of the caster's side, NOT including the caster */public static const RANDOM_ALLY:String = "spell::scope::randomAlly"
		/** Effects a random member of the enemies side*/public static const RANDOM_ENEMY:String = "spell::scope::randomEnemy"
		/** Effects any random member of the battle */public static const RANDOM_ANY:String = "spell::scope::randomAny"
		/** Effects any random member of the battle, aside from the caster */public static const RANDOM_ANY_NOT_CASTER:String = "spell::scope::randomAnyBarCaster"
		
		/** Effects the entire caster's side, including the caster */public static const ALL_ALLIES_AND_SELF:String = "spell::scope::allAlliesAndSelf"
		/** Effects the entire caster's side, aside from the caster */public static const ALL_ALLIES:String = "spell::scope::allAllies"
		/** Effects the entire enemy side */public static const ALL_ENEMIES:String = "spell::scope::allEnemies"
		/** Effects the entirity of one side, randomly determined */public static const ALL_EITHER_TEAM_RANDOM_PICK:String = "spell::scope::allRandomPick";
		/** Effects the entirity of one side, chosen by the caster */public static const ALL_EITHER_TEAM_USER_PICKS:String = "spell::scope::allTeamUserPicks";
		
		/** Effects the EVERYONE in the battle */public static const EVERYONE:String = "spell::scope::allParticipants"
		/** Effects the EVERYONE in the battle, aside from the caster */public static const EVERYONE_BAR_SELF:String = "spell::scope::allParticipantsBarSelf";
		/** Effects no one in particular */public static const NOONE:String = "spell::scope::noScope";
	}

}