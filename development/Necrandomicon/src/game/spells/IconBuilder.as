package game.spells 
{
	import game.spells.constants.SpellEffectConstants;
	import game.spells.constants.SpellElementConstants;
	import game.spells.constants.SpellElementEffectConstants;
	import game.spells.constants.SpellTargetConstants;
	/**
	 * ...
	 * @author Keith Evans @ heatknives.com
	 */
	public class IconBuilder 
	{
		static private var _instance:IconBuilder;
		public static function getInstance():IconBuilder {
			if (_instance == null) {
				_instance = new IconBuilder();
			}
			return _instance
		}
		
		private var iconOps:Vector.<ScopeVO>;
			private var containsAtLeastOneTarget:Boolean;
			private var containsAtLeastOneElement:Boolean;
			private var containsAtLeastOneElementEffect:Boolean;
			private var containsAtLeastOneSpellEffect:Boolean;
			
		private var id:String;
		private var image:String;
		private var defaultTargetType:ScopeVO;
		private var defaultElement:ScopeVO;
		private var defaultElementEffect:ScopeVO;
		private var defaultSpellEffect:ScopeVO;
		
		private var currentIcons:Vector.<IconObject>;
		
		
		public function IconBuilder() 
		{
			if (_instance) {
				throw new Error("Singleton error! Object already exists! use the IconBuilder.getInstance() method to retrieve!", 10101);
				this = null;
				return;
			}
			
			
			currentIcons = new Vector.<IconObject>();
			
			defaultTargetType = new ScopeVO();
				defaultTargetType.scopeOperation = ScopeVO.TARGET;
				defaultTargetType.scopeType = SpellTargetConstants.TARGET_ENEMY;
				defaultTargetType.scopeWeight = 1;
				
			defaultElement = new ScopeVO();
				defaultElement.scopeOperation = ScopeVO.ELEMENT_TYPE;
				defaultElement.scopeType = SpellElementConstants.GENERIC;
				defaultElement.scopeWeight = 1;
				
			defaultElementEffect = new ScopeVO();
				defaultElementEffect.scopeOperation = ScopeVO.ELEMENT_EFFECT
				defaultElementEffect.scopeType = SpellElementEffectConstants.NORMAL_EFFECT;
				defaultElementEffect.scopeWeight = 1;
			
			defaultSpellEffect = new ScopeVO();
				defaultSpellEffect.scopeOperation = ScopeVO.SPELL_EFFECT
				defaultSpellEffect.scopeType = SpellEffectConstants.DAMAGE_MINOR;
				defaultSpellEffect.scopeWeight = 1;
				
			reset();
			_instance = this;
		}
		
		public function reset():void {
			id = "";
			image = "";
			iconOps = new Vector.<ScopeVO>();
			containsAtLeastOneElement = false;
			containsAtLeastOneElementEffect = false;
			containsAtLeastOneSpellEffect = false;
			containsAtLeastOneTarget = false;
		}
		
		public function setID(newId:String):void {
			
			for (var i:int = 0; i < currentIcons.length; i++) {
				if (currentIcons[i].iconID == newId) {
					throw("ID Clash. Use a different ID", 10111);
					id = "";
					return;
				}
			}
			
			id = newId;
		}
		public function addScope(vIn:ScopeVO):void {
			switch(vIn.scopeType) {
				case ScopeVO.ELEMENT_EFFECT: containsAtLeastOneElement = true; break;
				case ScopeVO.ELEMENT_TYPE: containsAtLeastOneElementEffect = true; break;
				case ScopeVO.SPELL_EFFECT: containsAtLeastOneSpellEffect = true; break;
				case ScopeVO.TARGET: containsAtLeastOneTarget = true; break;
			}
			iconOps.push(vIn);
		}
		
		public function buildIcon():IconObject {
			
			if (id == "") {throw new Error("Icon ID not set correctly. Please assign a unique ID", 10121); return null}
			if (image == "") {throw new Error("Icon Image not set correctly. Please assign", 10122); return null}
			if (!containsAtLeastOneTarget) iconOps.push(defaultTargetType.clone())
			if (!containsAtLeastOneElement) iconOps.push(defaultElement.clone())
			if (!containsAtLeastOneElementEffect) iconOps.push(defaultElementEffect.clone())
			if (!containsAtLeastOneSpellEffect) iconOps.push(defaultSpellEffect.clone())
			
			
			var newIcon:IconObject = new IconObject(id, image, iconOps);
			
			currentIcons.push(newIcon);
			
			reset();
			
			return newIcon
			
		}
		
		public function getIconByID($id:String):IconObject {
			for (var i:int = 0; i < currentIcons.length; i++) {
				if(currentIcons[i].iconID == id) return currentIcons[i]
			}
			throw new Error("ID not found. Nothing to return", 10131);
			return null;
		}
		
		public function getAllIDs():Vector.<String> {
			
			if (currentIcons.length == 0) {
				throw new Error("No Entries. Nothing to return!", 10141);
				return new Vector.<String>();
			}
			
			var vector:Vector.<String> = new Vector.<String>();
			
			for (var i:int = 0; i < currentIcons.length; i++) {
				vector.push(currentIcons[i].iconID);
			}
			return vector;
			
		}
		
		public function setImage(iconReference:String):void 
		{
			//TODO: Check icon exists in database!
			image = iconReference
		}
		
	}

}