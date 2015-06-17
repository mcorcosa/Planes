package model 
{
	import model.VO.BoardVO;
	import model.VO.PlaneVO;
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	/**
	 * Proxy pentru acces la BoardVO
	 * @author gh
	 */
	public class BoardProxy extends Proxy implements IProxy 
	{

		public var Board:BoardVO;
		
		public function BoardProxy(NAME:String, size:int)
		{
			super(NAME, new BoardVO(size));
			trace(NAME+"created");
		}
		
		public function get vo():BoardVO
        {
            return data as BoardVO;
        }
		
		public function getBoardSize():int {
			return vo.size;
		}
		
		public function displayBoard():void {
			vo.display();
		}
		
		public function addPlane(posx:int, posy:int, planeToPlace:PlaneVO):void {
			for (var j:int = posx; j < planeToPlace.size+posx; j++) 
			{
				for (var i:int = posy; i < planeToPlace.size+posy; i++) 
				{
					trace("Avionul cu id " + vo.planes + ", Size " + planeToPlace.size + ", Shape " + planeToPlace.shape + ", depus pe board "+vo+", la pozitia "+posx+"  "+posy);
					//vo.map[i][j]=planeToPlace.map[i-posx][j-posy]
				}
			}
			vo.planes++;
		}
		
	}

}