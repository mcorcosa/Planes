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
		
	}

}