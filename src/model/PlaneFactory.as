package model 
{
	import flash.sampler.ClassFactory;
	import model.VO.PlaneVO;
	
	/**
	 * ...
	 * @author gh
	 */
	public class PlaneFactory
	{
		
		public function PlaneFactory() 
		{
			
		}
		
		public function createPlane(size:int, shape:int):PlaneVO{
			return new PlaneVO(size, shape);
		}
	}

}