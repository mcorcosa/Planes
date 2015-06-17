package model
{
	import model.VO.PlayerVO;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	import view.mediators.IntroScreenMediator;
	
	/**
	 * Proxy pentru acces la PlayerVO
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
			vo.setName(PlayerName);
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