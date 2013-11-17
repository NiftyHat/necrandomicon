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
		protected var _rank:int = 3;
		
		
		public function BattleAction() 
		{
			
		}
		
		public static function createAction ($name:String, $rank:int):BattleAction {
			var newAction:BattleAction = new BattleAction ();
			newAction.name = $name;
			newAction.rank = $rank;
			return newAction;
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