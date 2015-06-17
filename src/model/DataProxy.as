package model 
{
	import model.VO.DataVO;
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	/**
	 * ...
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
		
	}

}