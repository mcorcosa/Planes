package model 
{
	import model.VO.DataVO;
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	/**
	 * Proxy for handling and operating DataVO
	 * @author gh
	 */
	public class DataProxy extends Proxy implements IProxy 
	{
		
		public static const NAME:String = "DataProxy";
		
		public var Data:DataVO;
		
		public function DataProxy()
		{
			super(NAME, new DataVO());
		}
		
		public function loadXML():void
		{
			vo.loadXML();
		}
		
		public function get vo():DataVO
        {
            return data as DataVO;
        }
		
		public function getBoardSize():int {
			return vo.boardSize;
		}
		
		public function getPlaneSizes():Array {
			return vo.planeSize;
		}
		
		public function getPlaneShapes():Array {
			return vo.planeShape;
		}
		
	}

}