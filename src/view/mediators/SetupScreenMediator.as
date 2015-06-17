package view.mediators 
{
	import model.BoardProxy;
	import model.PlayerBoardProxy;
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import view.views.SetupScreen;
	
	/**
	 * ...
	 * @author gh
	 */
	public class SetupScreenMediator extends Mediator implements IMediator 
	{
		
		public static const NAME:String = " SetupScreenMediator";
		
		
		private var SS:SetupScreen;
		
		public function SetupScreenMediator(mediatorName:String = null, viewComponent:Object = null)
		{
			super(mediatorName, viewComponent);
		}
		
		override public function onRegister():void
		{
			SS = new SetupScreen;
			trace("SetupScreenMediator registered");
			viewComponent.addChild(SS);
			SS.display(playerBoardProxy.vo.map, playerBoardProxy.getBoardSize())
		}
		
		/*override public function listNotificationInterests():Array
		{
			return [StartSetupCommand.DISPLAYBOARD];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			
			switch (name)
			{
				case StartSetupCommand.DISPLAYBOARD: 
					//testeaza daca trebuie desenata tabla jucatorului sau CPU
					if (body is PlayerBoardProxy) {
						viewComponent.addChild(BV);
						trace(NAME+" got display player board command")
						BV.draw(body.getBoardMap(), body.getBoardSize());
					}
			}
		}*/
		private function get playerBoardProxy():BoardProxy
		{
			return facade.retrieveProxy(PlayerBoardProxy.NAME) as PlayerBoardProxy;
		}
		
	}

}