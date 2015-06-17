package view.mediators
{
	import events.StartGameEvent;
	import flash.events.DataEvent;
	import model.PlayerProxy;
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import org.puremvc.as3.patterns.observer.Notification;
	import view.views.IntroScreen;
	
	/**
	 * Mediator pentru Introscreen
	 * @author gh
	 */
	public class IntroScreenMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "IntroScreenMediator";
		public static const STARTSETUP:String = "Start Setup";
		private var IS:IntroScreen;
		
		public function IntroScreenMediator(mediatorName:String = null, viewComponent:Object = null)
		{
			super(mediatorName, viewComponent);
		}
		
		override public function onRegister():void
		{
			IS = new IntroScreen;
			viewComponent.addChild(IS);
			IS.display();
			//sendNotification(IntroScreen.DISPLAY);
			IS.addEventListener(StartGameEvent.STARTSETUP, startButtonClicked);
		}
		
		override public function listNotificationInterests():Array
		{
			return [IntroScreen.DISPLAY];
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
			}
		}
		
		public function startButtonClicked(e:StartGameEvent):void
		{
			//set up player
			var PlayerName:String = e.result as String;
			playerProxy.setPlayerName(PlayerName);
			trace(" Player name set to "+playerProxy.vo.name)
			viewComponent.removeChild(IS);
			sendNotification(STARTSETUP, viewComponent);
		}
		
		private function get playerProxy():PlayerProxy
		{
			return facade.retrieveProxy(PlayerProxy.NAME) as PlayerProxy;
		}
	
	}

}