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
		
		public function BoardVO(size:int) 
		{
			this.size = size;
			map = new Array(size);
			for (var i:int = 0; i < size; i++) 
			{
				map[i] = new Array (size);
				for (var j:int = 0; j < size; j++) 
				{
					map[i][j]=0;
				}
			}
		}
		
		public function display():void {
			for (var i:int = 0; i < size; i++) 
			{
				trace ("linia" +i);
				for (var j:int = 0; j < size; j++) 
				{
					trace (map[i][j]);
				}
			}
		}
		
		public function addPlane():void {
			planes++;
		}
		
	}

}