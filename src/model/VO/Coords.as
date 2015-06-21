package model.VO 
{
	import model.BoardProxy;
	/**
	 * Object used to encapsulate all the info for placing a plane onto a board
	 * @author ...
	 */
	public class Coords 
	{
			public var x:int;
			public var y:int;
			public var boardProxy:BoardProxy;
			public var planeToPlace:PlaneVO;
		
		public function Coords(x:int, y:int, boardProxy:BoardProxy, planeToPlace:PlaneVO) 
		{
			this.x = x;
			this.y = y;
			this.boardProxy = boardProxy;
			this.planeToPlace = planeToPlace;
		}
		
		
	}

}