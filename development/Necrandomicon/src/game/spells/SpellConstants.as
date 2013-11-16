package game.spells 
{
	/**
	 * ...
	 * @author KEvans
	 */
	public class SpellConstants 
	{
		
		public static const SELF:String = "spell::self"
		
		public static const TARGET_ALLY:String = "spell::targetAlly"
		public static const TARGET_ALLY_OR_SELF:String = "spell::targetAllyOrSelf"
		public static const TARGET_ENEMY:String = "spell::targetEnemy"
		public static const TARGET_ANY:String = "spell::targetAny";
		public static const TARGET_ANY_BAR_SELF:String = "spell::targetAnyBarSelf";
		
		public static const RANDOM_ALLY_OR_SELF:String = "spell::randomAllyOrSelf"
		public static const RANDOM_ALLY:String = "spell::randomAlly"
		public static const RANDOM_ENEMY:String = "spell::randomEnemy"
		public static const RANDOM_ANY:String = "spell::randomAny"
		
		public static const ALL_ALLIES_AND_SELF:String = "spell::allAlliesAndSelf"
		public static const ALL_ALLIES:String = "spell::allAllies"
		public static const ALL_ENEMIES:String = "spell::allEnemies"
		public static const ALL_EITHER_SIDE_USER_PICKS:String = "spell::allOneSideUserPicks";
		public static const ALL_EITHER_SIDE_RANDOM_PICK:String = "spell::allOneSideRandomPick";
		
		public static const EVERYONE:String = "spell::allParticipants"
		public static const EVERYONE_BAR_SELF:String = "spell::allParticipantsBarSelf";
		public static const NOONE:String = "spell::noScope";
	}

}