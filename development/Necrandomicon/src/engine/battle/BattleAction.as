package engine.battle 
{
	import engine.entities.EntityBattleCharacter;
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class BattleAction 
	{
		
		public var name:String = "default action";
		public var owner:EntityBattleCharacter;
		public var targetScope:String = TARGET_NONE;
		public var selectionScope:String = SCOPE_ANY;
		public var modifierScope:String = null;
		
		static public const TARGET_SINGLE:String = "selectionSingle";
		static public const TARGET_TEAM:String = "selectionTeam";
		static public const TARGET_EVERYONE:String = "selectionTeam";
		static public const TARGET_SELF:String = "selectionSelf";
		static public const TARGET_NONE:String = "selectionNone";
		
		static public const SCOPE_ALLY:String = "scopeAlly";
		static public const SCOPE_ENEMY:String = "scopeEnemy";
		static public const SCOPE_RANDOM:String = "scopeRandom";
		static public const SCOPE_ANY:String = "scopeAny";
		
		static public const NOT_SELF:String = "notSelf";
		
		
		protected var _rank:int = 3;
		
		
		public function BattleAction() 
		{
			
		}
		
		public static function createAction ($name:String, $rank:int, $selection:String = null):BattleAction {
			var newAction:BattleAction = new BattleAction ();
			newAction.name = $name;
			newAction.rank = $rank;
			newAction.selectionScope = $selection;
			return newAction;
		}
		
		public function execute($targets:Vector.<EntityBattleCharacter>):void {
			if (!$targets || !$targets) {
				trace(owner.name + " used " + name);
			} else {
				for each (var target:EntityBattleCharacter in $targets) {
				trace(owner.name + " used " + name + "on " + target.name );
				}
			}
			
		}
		
		public function get rank():int 
		{
			return _rank;
		}
		
		public function set rank(value:int):void 
		{
			_rank = value;
		}
		
	}

}