package engine.statistics 
{
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class Stats 
	{
		
		protected var dictStats:Object = {}
		
		public function Stats() 
		{
			
		}
		
		public function debugString():String 
		{
			var out:String = "";
			for (var statName:String in dictStats) {
				var stat:Stat = dictStats[statName];
				out += stat.id + " " + stat.current + "/" + stat.totalModified + "\n";
			}
			return out;
		}
		
		public function addStat($stat:Stat):Stat {
			dictStats[$stat.id] = $stat;
			return dictStats[$stat.id]
		}
		
		public function createStat($name:String, $current:int = 0, $total:int = 100):Stat {
			var stat:Stat = new Stat ();
			stat.id = $name;
			stat.current = $current;
			stat.totalUnmodified = $total;
			return addStat(stat);
		}
		
	}

}