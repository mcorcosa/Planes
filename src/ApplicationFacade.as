package
{
	import controller.StartupCommand;
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	import org.puremvc.as3.patterns.observer.Notification;
	
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
		
		//initializeaza Controllerul si face register la comenzi
		override protected function initializeController():void
		{
			super.initializeController();
			
			registerCommand(STARTUP, StartupCommand);
			
		}
		
		//declanseaza StartupCommand, prin notificatie catre Stage din main
		public function startup(stage:Object):void
		{
			sendNotification(STARTUP, stage);
		}
		
		//suprascrie sendNotification, ca sa adaug trace()
		override public function sendNotification(notificationName:String, body:Object = null, type:String = null):void
		{
			trace('Sent ' + notificationName);
			
			notifyObservers(new Notification(notificationName, body, type));
		}
	}

}