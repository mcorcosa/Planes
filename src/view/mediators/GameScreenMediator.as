package view.mediators 
{
	import controller.CPUSetupCommand;
	import controller.ShootCommand;
	import controller.StartSetupCommand;
	import events.ClickGridEvent;
	import model.BoardProxy;
	import model.CPUBoardProxy;
	import model.PlayerBoardProxy;
	import model.VO.Coords;
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import view.views.BoardView;
	
	/**
	 * Mediator for the screen displayed during the game
	 * @author gh
	 */
	public class GameScreenMediator extends Mediator implements IMediator 
	{
		public static const NAME:String = "GameScreenMediator";
		public static const DISPLAY:String = "Display"
		public static const SHOOT:String = "Shoot"
		
		private var BV:BoardView;
		public var PlayerBoardView:BoardView;
		public var CPUBoardView:BoardView;
		
		public function GameScreenMediator(mediatorName:String = null, viewComponent:Object = null)
		{
			super(mediatorName, viewComponent);
		}
		
		override public function onRegister():void
		{
			PlayerBoardView = new BoardView(playerBoardProxy);
			CPUBoardView = new BoardView(cPUBoardProxy);
			trace(" GameScreenMediator registered");
			viewComponent.addChild(PlayerBoardView);
			viewComponent.addChild(CPUBoardView);
			PlayerBoardView.display();
			CPUBoardView.display();
			
			CPUBoardView.addEventListener(ClickGridEvent.CLICKGRIDEVENT, gridClicked)
		}
		
		public function gridClicked(e:ClickGridEvent):void {
			var coords:Coords = new Coords(e.y, e.x, cPUBoardProxy, null);
			sendNotification(SHOOT, coords);
			viewComponent.addChild(PlayerBoardView);
			viewComponent.addChild(CPUBoardView);
			//PlayerBoardView.display();
			CPUBoardView.display();
		}
		
		override public function listNotificationInterests():Array
		{
			return [ShootCommand.UPDATE];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			PlayerBoardView.display();
		}
		
		private function get playerBoardProxy():BoardProxy
		{
			return facade.retrieveProxy(PlayerBoardProxy.NAME) as BoardProxy;
		}
		
		private function get cPUBoardProxy():BoardProxy
		{
			return facade.retrieveProxy(CPUBoardProxy.NAME) as BoardProxy;
		}
	}

}