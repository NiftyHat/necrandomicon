package engine.entities 
{
	import engine.battle.actions.AttackAction;
	import engine.battle.BattleAction;
	import engine.battle.BattleEncounter;
	import engine.battle.events.BattleCharacterEvent;
	import engine.battle.turns.BattleTurn;
	import engine.enums.SelectionScope;
	import engine.enums.TargetScope;
	import game.crux.Crux;
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
		protected var _counter:int;
		protected var _futureCounter:Vector.<int>
		protected var _counterScaleFactor:Number = 1.0;
		protected var _actions:Vector.<BattleAction>;
		
		protected var _battle:BattleEncounter;
		
		private static const TICK_TABLE:Array = [8, 8, 8, 7, 7, 6, 6, 5, 4, 3]
		private static const MAX_AHEAD_TURNS:int = 15;
		
		public function EntityBattleCharacter($name:String) 
		{
			name = $name;
			init();
			
			
		}
		
		public function onAddedToBattle($battle:BattleEncounter):void {
			_battle = $battle;
			trace(name + " joined the battle!"); 
		}
		
		private function init():void {
			_stats = new NecStats ();
			if (name.indexOf("?") != -1){
				_stats.randomize();
			}
			_actions = new Vector.<BattleAction> ();
			_actions.push (new AttackAction () );
			
			var targets:Array = [TargetScope.EVERYONE, TargetScope.NONE, TargetScope.SELF, TargetScope.SINGLE, TargetScope.TEAM];
			var selections:Array = [SelectionScope.ALLY, SelectionScope.ANY, SelectionScope.ENEMY, SelectionScope.RANDOM];
			for each (var target:TargetScope in targets) {
				for each (var selection:SelectionScope in selections) {
					var rank:int = (Math.random() * 5) + 1
					var name:String = target.Text + " \n " + selection.Text;
					_actions.push (BattleAction.createAction(name, rank, target,selection));
				}
			}
			
			//_actions.push (BattleAction.createAction("Wait", 1));
			calcTick();
		}
		
		
		private function calcTick():void {
			var len:int  = TICK_TABLE.length;
			var tickId:int =  ((len /100)  * _stats.speed.current) - 1;
			if (tickId > len) tickId = len;
			if (tickId < 0) tickId = 0;
			_tick = TICK_TABLE[tickId]
			
		}
		
		public function toString():String {
			return ("BattleCharacter " + name + "\n " + _stats.debugString() + "\n" + "Tick: " + _tick);
		}
		
		public function onJoinBattle():void 
		{
			calcTick();
		}
		
		public function updateHealth():void 
		{
			Crux.control.dispatchEvent(new BattleCharacterEvent(BattleCharacterEvent.UPDATE_STATS, this));
		}
		
		public function get isDead():Boolean {
			return (_stats.health.current <= 0);
		}
		
		public function get stats():NecStats 
		{
			return _stats;
		}
		
		public function get counter():int 
		{
			return _counter;
		}
		
		public function get counterScaleFactor():Number 
		{
			return _counterScaleFactor;
		}
		
		public function get tick():int 
		{
			return _tick;
		}
		
		public function get actions():Vector.<BattleAction> 
		{
			return _actions;
		}
		
	}

}