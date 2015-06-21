package controller 
{
	import model.BoardProxy;
	import model.CPUBoardProxy;
	import model.PlayerBoardProxy;
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import view.mediators.GameScreenMediator;
	
	/**
	 * ...
	 * @author gh
	 */
	public class StartGameCommand extends SimpleCommand implements ICommand 
	{
		public static const NAME:String = ' StartGameCommand'
		
		public function StartGameCommand() 
		{
			super();
		}
		
		override public function execute(notification:INotification):void 
		{
			facade.registerMediator(new GameScreenMediator(" GameScreenMediator", notification.getBody()));	
		}
		
		private function get playerBoardProxy():BoardProxy
		{
			return facade.retrieveProxy(PlayerBoardProxy.NAME) as PlayerBoardProxy;
		}
		
		private function get cPUBoardProxy():BoardProxy
		{
			return facade.retrieveProxy(CPUBoardProxy.NAME) as CPUBoardProxy;
		}
		
	}

}