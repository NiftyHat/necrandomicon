package engine.battle.turns 
{
	import engine.battle.BattleAction;
	import engine.battle.events.BattleTurnEvent;
	import engine.entities.EntityBattleCharacter;
	import game.crux.Crux;
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class ConditionalTurn extends BattleTurn
	{
		
		
		private var _tick:int;
		
		public function ConditionalTurn() 
		{
			
		}
		
		
		
		public function calcTick($turnNumber:int = 0):void 
		{
			var base:int = (_character.tick + (_action ? _action.rank : 3)) * _character.counterScaleFactor;
			_tick = base * ($turnNumber + 1);
		}
		
		public function get tick():int 
		{
			return _tick;
		}
		
		public function toString():String {
			return "BattleTurn tick:" + tick + " char:" + _character.name + " charTick:" + _character.tick + " charSpeed:" + _character.stats.speed.current +"\n";
		}
		
		public function start():void 
		{
			Crux.control.dispatchEvent(new BattleTurnEvent(BattleTurnEvent.START, this));
		}
		
		public function end():void 
		{
			Crux.control.dispatchEvent(new BattleTurnEvent(BattleTurnEvent.END, this));
		}
		
	}

}