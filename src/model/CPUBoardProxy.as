package model 
{
	/**
	 * Proxy for accessing a Board owned by CPU Player
	 * @author gh
	 */
	public class CPUBoardProxy extends BoardProxy
	{
		public static const NAME:String = " CPUBoardProxy ";
		
		public function CPUBoardProxy(size:int) 
		{
			super(NAME, size);
			
		}
		
		public function getBoardMap():Array {
			return vo.map;
		}
	}


}