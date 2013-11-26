package engine.battle 
{
	import engine.entities.EntityBattleCharacter;
	import engine.enums.TargetScope;
	import engine.enums.SelectionScope;
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class BattleAction 
	{
		
		public var name:String = "default action";
		public var owner:EntityBattleCharacter;
		public var targetScope:TargetScope = TargetScope.SINGLE;
		public var selectionScope:SelectionScope = SelectionScope.ANY;
		public var modifierScope:String = null;
		
		static public const NOT_SELF:String = "notSelf";
		
		
		protected var _rank:int = 3;
		
		
		public function BattleAction() 
		{
			
		}
		
		public static function createAction ($name:String, $rank:int, $targetScope:TargetScope = null, $selectionScope:SelectionScope = null):BattleAction {
			var newAction:BattleAction = new BattleAction ();
			newAction.name = $name;
			newAction.rank = $rank;
			if (!$targetScope) $targetScope = TargetScope.SINGLE;
			if (!$selectionScope) $selectionScope = SelectionScope.ANY;
			newAction.targetScope = $targetScope;
			newAction.selectionScope = $selectionScope;
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