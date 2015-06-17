package view.mediators 
{
	import events.ClickGridEvent;
	import model.BoardProxy;
	import model.PlayerBoardProxy;
	import model.VO.Coords;
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
		public static const PLACE:String = " Place"
		public static const CLICKGRIDEVENT:String = " Click grid Event";
		
		private var SS:SetupScreen;
		
		public function SetupScreenMediator(mediatorName:String = null, viewComponent:Object = null)
		{
			super(mediatorName, viewComponent);
		}
		
		override public function onRegister():void
		{
			trace(" SetupScreenMediator registered");
			SS = new SetupScreen;
			this.SS.addEventListener(ClickGridEvent.CLICKGRIDEVENT, gridClicked);
			viewComponent.addChild(SS);
			SS.display(playerBoardProxy.vo.map, playerBoardProxy.getBoardSize())
		}
		
		public function gridClicked(e:ClickGridEvent):void {
			trace(" mediator got click"+ e.x + " "+ e.y)
			var coords:Coords = new Coords(e.x, e.y, playerBoardProxy);
			sendNotification(PLACE, coords);
			//SS.display(playerBoardProxy.vo.map, playerBoardProxy.getBoardSize())
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