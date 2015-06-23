package model.VO 
{
	/**
	 * VO that keeps the size and map of a board
	 * TODO: could be refactored to "contain" planes at certain coordinates
	 * @author gh
	 */
	public class BoardVO 
	{
		public var size:int;
		public var map:Array;
		public var planes:int = 0;
		
		public function BoardVO() 
		{
			
		}
		
	}

}