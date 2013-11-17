package engine.battle 
{
	import engine.battle.events.UIEvent;
	import engine.entities.EntityBattleCharacter;
	import flash.events.EventDispatcher;
	import game.crux.Crux;
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class BattleEncounter extends EventDispatcher
	{
		
		private var _characters:Vector.<EntityBattleCharacter>
		
		private var _teamAlly:Vector.<EntityBattleCharacter>;
		private var _teamEnemy:Vector.<EntityBattleCharacter>
		
		public function BattleEncounter() 
		{
			init();
			addAlly(new EntityBattleCharacter("Player"));
			addEnemy(new EntityBattleCharacter("Random_1"));
			addEnemy(new EntityBattleCharacter("Random_2"));
			addEnemy(new EntityBattleCharacter("Random_3"));
			addEnemy(new EntityBattleCharacter("Random_4"));
			Crux.control.dispatchEvent(new UIEvent(UIEvent.BATTLE_SETUP, this));
		}
		
		private function init():void 
		{
			_characters = new Vector.<EntityBattleCharacter> ();
			_teamAlly = new Vector.<EntityBattleCharacter> ();
			_teamEnemy = new Vector.<EntityBattleCharacter> ();
			
		}
		
		public function getTeam($character:EntityBattleCharacter):Vector.<EntityBattleCharacter> {
			if (_teamAlly.indexOf($character) != -1) {
				return _teamAlly;
			}
			if (_teamEnemy.indexOf($character) != -1) {
				return _teamEnemy;
			}
			return null;
		}
		
		public function addAlly($character:EntityBattleCharacter):void {
			_teamAlly.push($character);
		}
		
		public function addEnemy($enemy:EntityBattleCharacter):void {
			_teamEnemy.push($enemy);
		}
		
		public function get teamAlly():Vector.<EntityBattleCharacter> 
		{
			return _teamAlly;
		}
		
		public function get teamEnemy():Vector.<EntityBattleCharacter> 
		{
			return _teamEnemy;
		}
		
	}

}