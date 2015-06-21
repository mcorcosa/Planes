package model 
{
	import org.puremvc.as3.interfaces.IProxy;
	
	/**
	 * Proxy for accessing a Board owned by human Player
	 * @author gh
	 */
	public class PlayerBoardProxy extends BoardProxy implements IProxy 
	{
		public static const NAME:String = " PlayerBoardProxy ";
		
		public function PlayerBoardProxy(size:int) 
		{
			super(NAME, size);
			
		}
		
		public function getBoardMap():Array {
			return vo.map;
		}
	}

}