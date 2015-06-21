package controller
{
	import model.DataProxy;
	import model.PlayerProxy;
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import view.mediators.GameScreenMediator;
	import view.mediators.IntroScreenMediator;
	
	/**
	 * Starts the app up, registers facade, some mediators and proxies
	 * @author gh
	 */
	public class StartupCommand extends SimpleCommand implements ICommand
	{
		
		public function StartupCommand()
		{
			super();
		
		}
		
		//registers some Proxies, Mediators
		override public function execute(notification:INotification):void
		{
			facade.registerMediator(new IntroScreenMediator("IntroScreenMediator", notification.getBody()));
			facade.registerProxy(new PlayerProxy());
			//facade.registerMediator(new BoardViewMediator("PlayerBoardViewMediator", notification.getBody()));
			
			//load data from XML
			facade.registerProxy(new DataProxy());
			dataProxy.loadXML();
		}
		
		private function get dataProxy():DataProxy
		{
			return facade.retrieveProxy(DataProxy.NAME) as DataProxy;
		}
		
	
	}

}