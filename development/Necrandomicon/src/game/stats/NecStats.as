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
			health = createStat( { id:"Health", totalUnmodified:100, current:100, short:"HP" } );// } "Health", 100, 100);
			offense = createStat( { id:"Offense", totalUnmodified:5, current:10, short:"OFF" } );
			defense = createStat( { id:"Defense", totalUnmodified:5, current:10, short:"DEF" } );
			speed = createStat( { id:"Speed", totalUnmodified:50, current:100, short:"SPD" });
		}
		
	}

}