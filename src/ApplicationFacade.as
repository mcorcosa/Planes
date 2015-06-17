package
{
	import controller.StartSetupCommand;
	import controller.StartupCommand;
	import controller.PlacePlanesCommand;
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	import org.puremvc.as3.patterns.observer.Notification;
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
		
		//instantiaza ApplicationFacade, apelata in main
		public static function getInstance():ApplicationFacade
		{
			return (instance ? instance : new ApplicationFacade()) as ApplicationFacade;
		}
		
		//TODO: scrie + fa register la comenzile de care mai e nevoie
		//initializeaza Controllerul si face register la comenzi
		override protected function initializeController():void
		{
			super.initializeController();
			
			registerCommand(STARTUP, StartupCommand);
			registerCommand(IntroScreenMediator.STARTSETUP, StartSetupCommand);
			registerCommand(SetupScreenMediator.PLACE, PlacePlanesCommand);
		}
		
		public function startup(stage:Object):void
		{
			sendNotification(STARTUP, stage);
		}
		
		//suprascrie sendNotification, ca sa adaug trace()
		override public function sendNotification(notificationName:String, body:Object = null, type:String = null):void
		{
			trace(' Sent ' + notificationName);
			
			notifyObservers(new Notification(notificationName, body, type));
		}
	
	}

}