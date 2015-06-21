package model 
{
	import flash.sampler.ClassFactory;
	import model.VO.PlaneVO;
	
	/**
	 * A factory used to create Plane objects, may be useful when larger amounts of planes is needed
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