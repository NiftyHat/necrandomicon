package engine.battle 
{
	import engine.entities.EntityBattleCharacter;
	import flash.events.EventDispatcher;
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
			trace(_teamAlly);
			trace(_teamEnemy)
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