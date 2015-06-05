package view.mediators
{
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import view.views.IntroScreen;
	
	/**
	 * Mediator pentru Introscreen
	 * @author gh
	 */
	public class IntroScreenMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "IntroScreenMediator";
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
	
	}

}