package engine.enums 
{
	import engine.utils.Enum;
	/**
	 * ...
	 * @author Duncan Saunders
	 */
	public class SelectionScope extends Enum
	{
		
		static public const ALLY:SelectionScope = new SelectionScope ();
		static public const ENEMY:SelectionScope = new SelectionScope ();
		static public const RANDOM:SelectionScope = new SelectionScope ();
		static public const ANY:SelectionScope = new SelectionScope ();
		static public const NONE:SelectionScope = new SelectionScope ();
		
		{Enum.InitEnumConstants(SelectionScope);}
		
	}

}