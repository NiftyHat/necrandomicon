package engine.battle.turns 
{
	import engine.battle.BattleAction;
	import engine.battle.BattleEncounter;
	import engine.entities.EntityBattleCharacter;
	import feathers.data.VectorIntListCollectionDataDescriptor;
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class ConditionalTurnManager 
	{
		private var _minBiggestCounter:int;
		
		protected var _battle:BattleEncounter;
		protected var _turns:Vector.<ConditionalTurn>;
		protected var _minPredictionLookahead:int = 0;
		
		public function ConditionalTurnManager() 
		{
			_turns = new Vector.<ConditionalTurn> ();
		}
		
		public function setBattle($battle:BattleEncounter):void {
			_battle = $battle;
		}
		
		public function removeFirstTurn():ConditionalTurn {
			return _turns.shift();
		}
		
		public function removeTurn($turn:ConditionalTurn):void {
			_turns.splice(_turns.indexOf($turn),1);
		}
		
		public function updateTurns():void {
			var characters:Vector.<EntityBattleCharacter> = _battle.characters;
			var tempCharacters:Vector.<EntityBattleCharacter> = characters.slice();
			var lookAhead:int = _minPredictionLookahead;
			var biggestCounter:int = 0;
			var predictedTurnCount:int = 0;
			while (_turns.length < 16) {
				if (tempCharacters.length == 0) {
					throw new Error ("no characters in battle :/");
				}
				for each (var item:EntityBattleCharacter in tempCharacters) {
					if (item.isDead) {
						//don't bother predicting turns for dead characters, dummy.
						//tempCharacters.splice(tempCharacters.indexOf(item), 1);
						continue;
					}
					if (tempCharacters.length == 0) {
						throw new Error ("no characters left to make preditions for :/");
					}
					var turn:ConditionalTurn = new ConditionalTurn ();
					turn.manager = this;
					turn.character = item;
					turn.calcTick(lookAhead);
					if (turn.tick > biggestCounter) {
						biggestCounter = turn.tick;
					}
					if (predictedTurnCount < 16 || turn.tick < biggestCounter) {
						_turns.push(turn);
					} else {
						//this charactures future turn is too far in the future, so stop looking;
						tempCharacters.splice(tempCharacters.indexOf(item), 1);
					}
					predictedTurnCount++;
				}
				_minPredictionLookahead = lookAhead;
				lookAhead += 1;
			}
			_turns.sort(sortTurnsOnSpeed);
			//trace(_turns);
		}
		
		public function getNextTurn():ConditionalTurn 
		{
			if (_turns.length == 0) {
				throw new Error ("No turn avalible. Did you update the turns list");
			}
			return _turns[0]
		}
		
		private function sortTurnsOnSpeed($turnA:ConditionalTurn, $turnB:ConditionalTurn):int 
		{
			if ($turnA.tick < $turnB.tick) {
				return -1;
			} else if ($turnA.tick > $turnB.tick) {
				return 1;
			} else {
				if ($turnA.character.stats.speed < $turnB.character.stats.speed) {
					return 1;
				} else if ($turnA.character.stats.speed > $turnB.character.stats.speed) {
					return -1;
				}
			}
			return 0;
		}
		
		public function get turns():Vector.<ConditionalTurn> 
		{
			return _turns;
		}
		
	}

}