package game.spells 
{
	import game.spells.constants.SpellAnimationConstants;
	import game.spells.constants.SpellElementConstants;
	import game.spells.constants.SpellTargetConstants;
	/**
	 * ...
	 * @author KEvans
	 */
	public class SpellScope implements ISpellScope
	{
		
		public function SpellScope() 
		{
			
		}
		
		public function get effects():Vector.<SpellEffectVO>{return new Vector.<SpellEffectVO>();	}
		public function get target():String {return SpellTargetConstants.NOONE;	}
		
		public function get animation():String 	{return SpellAnimationConstants.GENERIC_SLASH;	}
		
		public function get speedModification():int 	{return 0;	}
		public function get power():int 	{return 0;}
		
	}

}