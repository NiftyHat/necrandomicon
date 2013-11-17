package game.stats 
{
	import engine.statistics.Stat;
	import engine.statistics.Stats;
	/**
	 * ...
	 * @author Keith Evans @ heatknives.com
	 */
	public class NecStats extends Stats 
	{
		
		public var health:Stat;
		public var offense:Stat;
		public var defense:Stat;
		public var speed:Stat;
		
		public function NecStats() 
		{
			init()
		}
		
		public function randomize():void 
		{
			health.randomize();
			offense.randomize();
			defense.randomize();
			//speed.randomize();
		}
		
		private function init():void 
		{
			health = createStat("Health", 100, 100);
			offense = createStat("Offense", 5, 10);
			defense = createStat("Defense", 5, 10);
			speed = createStat("Speed", 50, 100);
		}
		
	}

}