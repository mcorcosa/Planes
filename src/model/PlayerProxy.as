package model
{
	import model.VO.PlayerVO;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	import view.mediators.IntroScreenMediator;
	
	/**
	 * Proxy for access to PlayerVO
	 * @author gh
	 */
	public class PlayerProxy extends Proxy implements IProxy
	{
		public static const NAME:String = "PlayerProxy";
		
		public var Player:PlayerVO;
		
		public function PlayerProxy()
		{
			super(NAME, new PlayerVO());
		}
		
		public function setPlayerName(PlayerName:String):void
		{
			vo.name = PlayerName;
		}
		
		public function get vo():PlayerVO
        {
            return data as PlayerVO;
        }
		
		public function getNumberOfPlanes():int {
			return vo.numberOfPlanes;
		}
		
		public function addPlane():void {
			vo.numberOfPlanes++;
		}
	
	}

}