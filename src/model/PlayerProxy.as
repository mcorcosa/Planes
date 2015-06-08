package model 
{
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	/**
	 * Proxy pentru acces la PlayerVO
	 * @author gh
	 */
	public class PlayerProxy extends Proxy implements IProxy 
	{
		
		public function PlayerProxy() 
		{
			
		}
		
<<<<<<< HEAD
=======
		public function setPlayerName(PlayerName:String):void
		{
			Player.setName(PlayerName);
		}
	
>>>>>>> parent of e7156ae... Finished Intro Screen and loading from external XML file
	}

}