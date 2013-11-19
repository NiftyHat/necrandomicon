package engine.battle.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Duncan Saunders @ niftyhat.com
	 */
	public class UIEvent extends Event 
	{
		static public const BATTLE_SETUP:String = "battleSetup";
		static public const ACTION_SELECT:String = "actionSelect";
		static public const HIDE_ACTION_SELECT:String = "hideActionSelect";
		static public const TARGET_SELECT_PROMPT:String = "targetSelectPrompt";
		
		protected var _data:*;
		
		public function UIEvent(type:String,data:*, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new UIEvent(type, data, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("BattleEvent", "data", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get data():* 
		{
			return _data;
		}
		
	}
	
}