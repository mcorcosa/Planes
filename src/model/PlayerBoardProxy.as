package model 
{
	import org.puremvc.as3.interfaces.IProxy;
	
	/**
	 * ...
	 * @author gh
	 */
	public class PlayerBoardProxy extends BoardProxy implements IProxy 
	{
		public static const NAME:String = " PlayerBoardProxy";
		
		public function PlayerBoardProxy(size:int) 
		{
			super(NAME, size);
			
		}
		
		public function getBoardMap():Array {
			return vo.map;
		}
	}

}