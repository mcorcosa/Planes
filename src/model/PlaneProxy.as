package model 
{
	import model.VO.PlaneVO;
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	/**
	 * ...
	 * @author gh
	 */
	public class PlaneProxy extends Proxy implements IProxy 
	{
		public static const NAME:String = "PlaneProxy";
		
		//constructor
		public function PlaneProxy()
        {
            super( NAME, new DataVO() );
        }
 
		//functie ce returneaza VO
        public function get vo():PlaneVO
        {
            return data as PlaneVO;
        }
	}
}