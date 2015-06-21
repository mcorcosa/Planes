package model.VO 
{
	/**
	 * VO keeping a set of 4 different planes, created using the data from DataVO
	 * @author ...
	 */
	public class PlaneSetVO 
	{
		public var numberOfPlanes:int = 0;
		public var collection:Array=new Array(Globals.NUMBER_OF_PLANES);
		
		public function PlaneSetVO() 
		{
			
		}
	}

}