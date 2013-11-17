package game.spells
{
	import flash.display.DisplayObject;
	
	/**
	 * ...
	 * @author Keith Evans @ heatknives.com
	 */
	public class IconObject
	{
		
		public var iconID:String;
		public var iconImage:String; //TODO: Replace!!!
		public var iconOperations:Vector.<ScopeVO> = new Vector.<ScopeVO>();
		
		function IconObject(iconID:String, iconImage:String, iconOperations:Vector.<ScopeVO>)
		{
			this.iconID = iconID;
			this.iconImage = iconImage;
			this.iconOperations = iconOperations;
			
		}	
		
	}

}