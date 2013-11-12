package info 
{
	import com.niftyhat.math.NHRangedNumber;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Duncan Saunders
	 */
	public class InfoStats 
	{
		
		public var hp:NHRangedNumber = new NHRangedNumber (100, 0, 100, "hp");
		
		public var off:NHRangedNumber= new NHRangedNumber (10, 0, 5, "off");
		public var def:NHRangedNumber = new NHRangedNumber (10, 0, 5, "def");
		public var spd:NHRangedNumber = new NHRangedNumber (10, 0, 5, "spd");
		
		
		var _dict:Dictionary;
		
		public function InfoStats() 
		{
			_dict = new Dictionary ();
			for (var item:String in this)
			{
				add(this[item], item);
			}
		}
		
		public function destroy():void
		{
			_dict = null;
		}
		
		public function get($statName:String):NHRangedNumber {
			if ($statName in _dict)
			{
				return _dict[$statName]
			}
			return null
		}
		
		public function add($stat:NHRangedNumber, $key:String = null)
		{
			if (!$key) _dict[$stat.name] = $stat;
			else  _dict[$key] = $stat;
		}
		
		public function remove($stat:*)
		{
			if ($stat is NHRangedNumber)
			{
				delete _dict[$stat.name];
			}
			if ($stat is String)
			{
				delete _dict[$stat];
			}
		}
		
	}

}