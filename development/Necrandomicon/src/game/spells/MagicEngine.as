package game.spells 
{
	import game.spells.constants.*;
	import game.spells.constants.SpellElementConstants;
	import game.spells.interfaces.ISpellScope;
	/**
	 * ...
	 * @author Keith Evans @ heatknives.com
	 */
	public class MagicEngine 
	{
		private static var _instance:MagicEngine;
		
		public static function getInstance():MagicEngine {
			if (_instance == null) {
				_instance = new MagicEngine();
			}
			return _instance;
		}
		
		public function MagicEngine() 
		{
			if (_instance != null) {
				//this = null;
				return
			}
			else _instance = this;
			
			
			IconBuilder.getInstance().setID("Claw");
			IconBuilder.getInstance().setImage("Claw01");
			IconBuilder.getInstance().addScope(ScopeVO.TARGET, SpellTargetConstants.TARGET_ENEMY, 10);
			IconBuilder.getInstance().addScope(ScopeVO.TARGET, SpellTargetConstants.RANDOM_ENEMY, 6);
			IconBuilder.getInstance().addScope(ScopeVO.TARGET, SpellTargetConstants.ALL_ENEMIES, 3);
			IconBuilder.getInstance().addScope(ScopeVO.TARGET, SpellTargetConstants.EVERYONE_BAR_SELF, 1);
			IconBuilder.getInstance().addScope(ScopeVO.ELEMENT_TYPE, SpellElementConstants.GENERIC, 10);
			IconBuilder.getInstance().addScope(ScopeVO.ELEMENT_TYPE, SpellElementConstants.BEAST, 4);
			IconBuilder.getInstance().addScope(ScopeVO.ELEMENT_EFFECT, SpellElementEffectConstants.NORMAL_EFFECT, 10);
			IconBuilder.getInstance().addScope(ScopeVO.ELEMENT_EFFECT, SpellElementEffectConstants.ELEMENT_IS_WEAK_TO, 4);
			IconBuilder.getInstance().addScope(ScopeVO.SPELL_EFFECT, SpellEffectConstants.DAMAGE_MINOR, 10);
			IconBuilder.getInstance().addScope(ScopeVO.SPELL_EFFECT, SpellEffectConstants.DAMAGE_MAJOR, 5);
			IconBuilder.getInstance().addScope(ScopeVO.SPELL_EFFECT, SpellEffectConstants.DAMAGE_CRITICAL, 1);
			IconBuilder.getInstance().buildIcon();
			
			IconBuilder.getInstance().setID("Fireball");
			IconBuilder.getInstance().setImage("Fireball.gif");
			IconBuilder.getInstance().addScope(ScopeVO.SPELL_EFFECT, SpellEffectConstants.DAMAGE_MAJOR);
			IconBuilder.getInstance().addScope(ScopeVO.TARGET, SpellTargetConstants.ALL_EITHER_TEAM_RANDOM_PICK);
			IconBuilder.getInstance().addScope(ScopeVO.ELEMENT_TYPE, SpellElementConstants.DRAGON);
			IconBuilder.getInstance().addScope(ScopeVO.ELEMENT_TYPE, SpellElementConstants.GENERIC);
			IconBuilder.getInstance().addScope(ScopeVO.ELEMENT_EFFECT, SpellElementEffectConstants.NO_EFFECT_ELEMENT);
			IconBuilder.getInstance().addScope(ScopeVO.ELEMENT_EFFECT, SpellElementEffectConstants.ELEMENT_SUFFERS_INSTANT_DEATH);
			IconBuilder.getInstance().buildIcon();
			
		}
		public function generateSpell(icon:IconObject, chaosFactor:Number):Spell
		{
			var effectTargetTypes:Vector.<ScopeVO> = new Vector.<ScopeVO>()
			var effectElementTypes:Vector.<ScopeVO>= new Vector.<ScopeVO>()
			var effectElementEffectTypes:Vector.<ScopeVO>= new Vector.<ScopeVO>()
			var effectSpellEffectTypes:Vector.<ScopeVO>= new Vector.<ScopeVO>()
			
			var i:int, j:int;
			
			// Build a dictionary of terms to use based on the icon
			for (i = 0; i < icon.iconOperations.length; i++) {
				switch(icon.iconOperations[i].scopeType) {
					
					case ScopeVO.TARGET:
						for (j = 0; j < icon.iconOperations[i].scopeWeight; j++) {
							effectTargetTypes.push(icon.iconOperations[i]);
						} break;
					case ScopeVO.ELEMENT_TYPE:
						for (j = 0; j < icon.iconOperations[i].scopeWeight; j++) {
							effectElementTypes.push(icon.iconOperations[i]);
						} break;
					case ScopeVO.ELEMENT_EFFECT:
						for (j = 0; j < icon.iconOperations[i].scopeWeight; j++) {
							effectElementEffectTypes.push(icon.iconOperations[i]);
						} break;
					case ScopeVO.SPELL_EFFECT:
						for (j = 0; j < icon.iconOperations[i].scopeWeight; j++) {
							effectSpellEffectTypes.push(icon.iconOperations[i]);
						} break;
				}
			}
			
			var scopeArrays:Vector.<ISpellScope> = new Vector.<ISpellScope>();
			var numberOfScopes:int = 1 + Math.random()*Math.sqrt(chaosFactor * 100);
			
			var scp:SpellScope = new SpellScope();
			for (var i:int = 0; i < numberOfScopes; i++) {
				
				scp.target = effectTargetTypes[int(Math.random() * effectTargetTypes.length)].scopeOperation;
				scp.spellType = effectSpellEffectTypes[int(Math.random() * effectSpellEffectTypes.length)].scopeOperation
				
				
				outerloop: for (i = 0; i < Math.random() * effectElementEffectTypes.length; i++ ) {
					var elementCombo:SpellEffectVO = new SpellEffectVO();
					elementCombo.element = effectElementTypes[int(Math.random() * effectElementTypes.length)].scopeOperation;
					
					for (var j:int = 0; j < scp.elements.length; j++) {
						if (scp.elements[j].element == elementCombo.element) continue outerloop;
					}
					
					elementCombo.elementEffect = effectElementEffectTypes[int(Math.random() * effectElementEffectTypes.length)].scopeOperation;
					
					scp.elements.push(elementCombo);
				}
				
				scopeArrays.push(scp);
				
			}
			
			var color1:int = Math.random() * 0xffffff //TODO: Generate Color based on terms?
			var color2:int = Math.random() * 0xffffff //As above
			var color3:int = Math.random() * 0xffffff //As above
			
			
			return new Spell(generateName(), scopeArrays, icon.iconImage, color1, color2, color3)
		}
		
		public function generateName():String 
		{
			return "Generic Spell Name"; //TODO: Make a fun name generator
		}
		
	}

}