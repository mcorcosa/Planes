package model
{
	import model.VO.PlaneSetVO;
	import model.VO.PlaneVO;
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	/**
	 * Proxy for accessing PlaneSetVO
	 * @author gh
	 */
	public class PlaneSetProxy extends Proxy implements IProxy
	{
		public static const NAME:String = "PlaneSetProxy";
		public var planeSet:PlaneSetVO;
		
		//constructor
		public function PlaneSetProxy()
		{
			super(NAME, new PlaneSetVO());
		}
		
		//functie ce returneaza VO
		public function get vo():PlaneSetVO
		{
			return data as PlaneSetVO;
		}
		
		public function addPlane(planeToAdd:PlaneVO):void
		{
			vo.collection[vo.numberOfPlanes] = planeToAdd;
			vo.numberOfPlanes++;
		}
	}

}