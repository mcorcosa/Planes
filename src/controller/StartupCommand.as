package controller
{
	import model.DataProxy;
	import model.PlayerProxy;
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import view.mediators.BoardViewMediator;
	import view.mediators.IntroScreenMediator;
	
	/**
	 * Porneste aplicatia, face register la mediatoare, proxies
	 * @author gh
	 */
	public class StartupCommand extends SimpleCommand implements ICommand
	{
		
		public function StartupCommand()
		{
			super();
		
		}
		
		//face register la Proxies, Mediatoare
		override public function execute(notification:INotification):void
		{
			facade.registerMediator(new IntroScreenMediator("IntroScreenMediator", notification.getBody()));
			facade.registerProxy(new PlayerProxy());
			facade.registerMediator(new BoardViewMediator("PlayerBoardViewMediator", notification.getBody()));
			
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