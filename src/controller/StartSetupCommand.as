package controller
{
	import model.DataProxy;
	import model.PlayerProxy;
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import view.mediators.BoardViewMediator;
	
	/**
	 * ...
	 * @author gh
	 */
	public class StartSetupCommand extends SimpleCommand implements ICommand
	{
		
		override public function execute(notification:INotification):void
		{
			var PlayerName:String = notification.getBody() as String;
			playerProxy.setPlayerName(PlayerName);
			facade.registerProxy(new DataProxy());
			dataProxy.loadXML();
			facade.registerMediator(new BoardViewMediator ("IntroScreenMediator", notification.getBody()));
		}
		
		private function get playerProxy():PlayerProxy
		{
			return facade.retrieveProxy(PlayerProxy.NAME) as PlayerProxy;
		}
		
		private function get dataProxy():DataProxy
		{
			return facade.retrieveProxy(DataProxy.NAME) as DataProxy;
		}
	
	}

}