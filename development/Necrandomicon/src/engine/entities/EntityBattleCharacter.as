package engine.entities 
{
	import game.stats.NecStats;
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class EntityBattleCharacter 
	{
		
		public var name:String;
		protected var _stats:NecStats
		protected var _tick:int;
		
		private static const TICK_TABLE:Array = [8,8,8,7,7,6,6,5,4,3]
		
		public function EntityBattleCharacter($name:String) 
		{
			name = $name;
			init();
			
			
		}
		
		private function init():void {
			_stats = new NecStats ();
			if (name.indexOf("Random") != -1){
				_stats.randomize();
			}
			
			calcTick();
		}
		
		private function calcTick():void {
			var len:int  = TICK_TABLE.length;
			var tickId:int =  ((len / _stats.speed.totalModified)  * _stats.speed.current) - 1;
			if (tickId > len) tickId = len;
			if (tickId < 0) tickId = 0;
			_tick = TICK_TABLE[tickId]
			
		}
		
		public function toString():String {
			return ("BattleCharacter " + name + "\n " + _stats.debugString() + "\n" + "Tick: " + _tick);
		}
		
		public function get isDead():Boolean {
			return (_stats.health.current <= 0);
		}
		
	}

}