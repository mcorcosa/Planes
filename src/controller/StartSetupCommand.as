package controller
{
	import flash.events.Event;
	import model.BoardProxy;
	import model.CPUBoardProxy;
	import model.DataProxy;
	import model.PlaneFactory;
	import model.PlaneSetProxy;
	import model.PlayerBoardProxy;
	import model.PlayerProxy;
	import model.VO.DataVO;
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import view.mediators.BoardViewMediator;
	import view.mediators.SetupScreenMediator;
	
	/**
	 * Sets up the game: boards, setup screen
	 * @author gh
	 */
	public class StartSetupCommand extends SimpleCommand implements ICommand
	{
		public static const NAME:String = 'StartSetupCommand ';
		public static const PLACE:String = NAME + 'PLACE';
		public static const DISPLAYBOARD:String = NAME + 'DISPLAY';
		
		override public function execute(notification:INotification):void
		{
			//get data from DataProxy
			var sizes:Array = dataProxy.getPlaneSizes();
			var shapes:Array = dataProxy.getPlaneShapes();
			
			//create a collection of Planes
			facade.registerProxy(new PlaneSetProxy());
			var Factory:PlaneFactory = new PlaneFactory;
			for (var i:int = planeSetProxy.vo.numberOfPlanes; i < Globals.NUMBER_OF_PLANES; i++) 
			{
				planeSetProxy.addPlane(Factory.createPlane(sizes[i], shapes[i]))
			}
			
			//set up player's board and its view
			facade.registerProxy(new PlayerBoardProxy(dataProxy.getBoardSize()));
			
			//start (Player) Setup Screen
			facade.registerMediator(new SetupScreenMediator(" SetupScreenMediator", notification.getBody()));			
						
			//set up CPU's board
			facade.registerProxy(new CPUBoardProxy(dataProxy.getBoardSize()));

			//TODO: muta in comanda de Start Game sendNotification(DISPLAYBOARD, playerBoardProxy)
			
			
		}
		private function get planeSetProxy():PlaneSetProxy
		{
			return facade.retrieveProxy(PlaneSetProxy.NAME) as PlaneSetProxy;
		}
		
		private function get playerBoardProxy():BoardProxy
		{
			return facade.retrieveProxy(PlayerBoardProxy.NAME) as PlayerBoardProxy;
		}
		
		private function get dataProxy():DataProxy
		{
			return facade.retrieveProxy(DataProxy.NAME) as DataProxy;
		}
		
	}

}