package view.mediators
{
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import view.views.IntroScreen;
	
	/**
	 * TODO: gaseste solutie sa trimiti data (playername) prin notificatie
	 * Mediator pentru Introscreen
	 * @author gh
	 */
	public class IntroScreenMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "IntroScreenMediator";
<<<<<<< HEAD
=======
		public static const STARTGAME:String = "StartGame";
>>>>>>> parent of e7156ae... Finished Intro Screen and loading from external XML file
		private var IS:IntroScreen;
		
		public function IntroScreenMediator(mediatorName:String = null, viewComponent:Object = null)
		{
			super(mediatorName, viewComponent);
		}
		
		override public function onRegister():void
		{
			IS = new IntroScreen;
			viewComponent.addChild(IS);
			
			sendNotification(IntroScreen.DISPLAY);
<<<<<<< HEAD
=======
			IS.addEventListener(StartGameEvent.STARTGAME, startButtonClicked);
>>>>>>> parent of e7156ae... Finished Intro Screen and loading from external XML file
		}
		
		override public function listNotificationInterests():Array
		{
			return [IntroScreen.DISPLAY, IntroScreen.START];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			
			switch (name)
			{
				case IntroScreen.DISPLAY: 
					IS.display();
					break;
				
				/*case IntroScreen.START: 
					IS.start();
					break;*/
			}
		}
<<<<<<< HEAD
=======
		
		public function startButtonClicked(e:StartGameEvent):void
		{
			sendNotification(STARTGAME, e.result);
			viewComponent.removeChild(IS);
		}
>>>>>>> parent of e7156ae... Finished Intro Screen and loading from external XML file
	
	}

}