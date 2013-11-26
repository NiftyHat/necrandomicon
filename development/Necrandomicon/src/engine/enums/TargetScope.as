package engine.enums 
{
	import engine.utils.Enum;
	/**
	 * ...
	 * @author Duncan Saunders
	 */
	public class TargetScope extends Enum
	{
		
		static public const SINGLE:TargetScope = new TargetScope ();
		static public const TEAM:TargetScope = new TargetScope ();
		static public const EVERYONE:TargetScope = new TargetScope ();
		static public const SELF:TargetScope = new TargetScope ();
		static public const NONE:TargetScope = new TargetScope ();
		
		{Enum.InitEnumConstants(TargetScope);}
		
	}

}