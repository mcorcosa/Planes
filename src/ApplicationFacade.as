package
{
	import controller.*;
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	import org.puremvc.as3.patterns.observer.Notification;
	import view.mediators.GameScreenMediator;
	import view.mediators.IntroScreenMediator;
	import view.mediators.SetupScreenMediator;
	
	/**
	 * ...
	 * @author gh
	 */
	public class ApplicationFacade extends Facade implements IFacade
	{
		public static const NAME:String = 'ApplicationFacade';
		
		public static const STARTUP:String = NAME + 'StartUp';
		
		//instantiates ApplicationFacade
		public static function getInstance():ApplicationFacade
		{
			return (instance ? instance : new ApplicationFacade()) as ApplicationFacade;
		}
		
		//initializes Controllerul and registers commands
		override protected function initializeController():void
		{
			super.initializeController();
			
			registerCommand(STARTUP, StartupCommand);
			registerCommand(IntroScreenMediator.STARTSETUP, StartSetupCommand);
			registerCommand(SetupScreenMediator.PLACE, PlacePlanesCommand);
			registerCommand(PlacePlanesCommand.BOARDFULL, CPUSetupCommand)
			registerCommand(CPUSetupCommand.PLACE, PlacePlanesCommand);
			registerCommand(SetupScreenMediator.STARTGAME, StartGameCommand)
			registerCommand(GameScreenMediator.SHOOT, ShootCommand)
		}
		
		public function startup(stage:Object):void
		{
			sendNotification(STARTUP, stage);
		}
		
		override public function sendNotification(notificationName:String, body:Object = null, type:String = null):void
		{
			trace(' Sent ' + notificationName);
			
			notifyObservers(new Notification(notificationName, body, type));
		}
	
	}

}