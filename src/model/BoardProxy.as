package model 
{
	import model.VO.BoardVO;
	import model.VO.PlaneVO;
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	/**
	 * Proxy for accessing BoardVO
	 * @author gh
	 */
	public class BoardProxy extends Proxy implements IProxy 
	{

		public var Board:BoardVO;
		
		public function BoardProxy(NAME:String, size:int)
		{
			super(NAME, new BoardVO());
			trace(NAME+"created");
			vo.size = size;
			vo.map = new Array(size);
			for (var i:int = 0; i < size; i++) 
			{
				vo.map[i] = new Array (size);
				for (var j:int = 0; j < size; j++) 
				{
					vo.map[i][j]=0;
				}
			}
		}
		
		public function get vo():BoardVO
        {
            return data as BoardVO;
        }
		
		public function getBoardSize():int {
			return vo.size;
		}
		
		public function displayBoard():void {
			for (var i:int = 0; i < vo.size; i++) 
			{
				trace (vo.map[i])
			}
		}
		
		
		public function addPlane(posx:int, posy:int, planeToPlace:PlaneVO):void {
			for (var i:int = posy; i < planeToPlace.size+posy; i++) 
			{
				for (var j:int = posx; j < planeToPlace.size+posx; j++) 
				{
					if(planeToPlace.map[j-posx][i-posy]==1)
						vo.map[i][j] = planeToPlace.map[j - posx][i - posy] + vo.planes;
				}
			}
			trace("Avionul cu id " + vo.planes + ", Size " + planeToPlace.size + ", Shape " + planeToPlace.shape + ", depus pe board "+vo+", la pozitia "+posx+"  "+posy);
			vo.planes++;
		}
		
		
	}

}