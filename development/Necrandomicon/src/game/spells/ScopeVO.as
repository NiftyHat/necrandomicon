package game.spells
{
	/**
	 * ...
	 * @author KEvans
	 */
	public class ScopeVO 
	{
		
		public static const ELEMENT_TYPE:String = "scope::type::element";
		static public const ELEMENT_EFFECT:String = "scope::type::element_effect";
		static public const TARGET:String = "scope::type::target";
		static public const SPELL_EFFECT:String = "scope::type::spell_effect";
		
		public var scopeOperation:String;
		public var scopeType:String;
		public var scopeWeight:int;
		
		public function clone():ScopeVO {
			
			var newItem:ScopeVO = new ScopeVO();
			newItem.scopeOperation = this.scopeOperation;
			newItem.scopeType = this.scopeType;
			newItem.scopeWeight = this.scopeWeight;
			
			return newItem;
		}
		
	}

}