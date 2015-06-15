package
{
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author gh
	 */
	public class Globals
	{
		public static var lightBlue:String = "#E0F8F7";
		
		public static var planeColor:String = "0x004080"
		
		public static var format:TextFormat = new TextFormat("Calibri", 20, 0x000040, true, false, false, null, null, "center", 0, 0);
		
		public static var smallFormat:TextFormat = new TextFormat("Calibri", 15, 0x000040, false, false, false, null, null, "center", 0, 0);
		
		public static var label:TextFormat = new TextFormat("Calibri", 12, 0xCCCCFF, false, false, false, null, null, "center", 0, 0);
		
		public static var NUMBER_OF_PLANES:int = 4;
		
		public static const HEXWIDTH:int = 15;
		
		public function Globals()
		{
		
		}
	
	}

}