package engine.battle.actions 
{
	import engine.battle.BattleAction;
	import engine.entities.EntityBattleCharacter;
	
	/**
	 * ...
	 * @author Duncan Saunders
	 */
	public class AttackAction extends BattleAction 
	{
		
		public function AttackAction() 
		{
			super();
			name = "Attack";
		}
		
		override public function execute($targets:Vector.<EntityBattleCharacter>):void {
			if (!$targets || !$targets) {
				trace(owner.name + " used " + name);
			} else {
				for each (var target:EntityBattleCharacter in $targets) {
					var dmg:int = ((owner.stats.offense.current * 3) - target.stats.defense.current);
					if (dmg < 0) dmg = 0;
					target.stats.health.current -= dmg;
					target.updateHealth();
					//trace(owner.name + " used " + name + "on " + target.name );
				}
			}
			
		}
		
	}

}