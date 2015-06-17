package controller
{
	import flash.events.Event;
	import model.BoardProxy;
	import model.DataProxy;
	import model.PlayerBoardProxy;
	import model.PlayerProxy;
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import view.mediators.BoardViewMediator;
	import view.mediators.SetupScreenMediator;
	
	/**
	 * ...
	 * @author gh
	 */
	public class StartSetupCommand extends SimpleCommand implements ICommand
	{
		public static const NAME:String = 'StartSetupCommand ';
		public static const PLACE:String = NAME + 'PLACE';
		public static const DISPLAYBOARD:String = NAME + 'DISPLAY';
		
		override public function execute(notification:INotification):void
		{

			
			//set up player's board and its view
			facade.registerProxy(new PlayerBoardProxy(dataProxy.getBoardSize()));
			
			//start Setup Screen
			facade.registerMediator(new SetupScreenMediator(" SetupScreenMediator", notification.getBody()));			
			
			//place player's planes onto the board
			//sendNotification(PLACE, playerBoardProxy);
			
			
			//TODO: muta in comanda de Start Game sendNotification(DISPLAYBOARD, playerBoardProxy)
			
			
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