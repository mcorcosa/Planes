package view.mediators 
{
	import controller.CPUSetupCommand;
	import controller.ShootCommand;
	import controller.StartSetupCommand;
	import events.ClickGridEvent;
	import flash.display.Shape;
	import flash.text.TextField;
	import model.BoardProxy;
	import model.CPUBoardProxy;
	import model.PlayerBoardProxy;
	import model.PlayerProxy;
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
		public static const UPDATE:String = "Update"
		public static const GAMEOVER:String = "GameOver"
		
		private var BV:BoardView;
		public var PlayerBoardView:BoardView;
		public var CPUBoardView:BoardView;
		public var winnerLabel:TextField;
		
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
			return [ShootCommand.UPDATE, ShootCommand.GAMEOVER];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			var name:String = String(notification.getName())
			
			
			switch (name) 
			{
				case UPDATE:
					PlayerBoardView.display();
					
				break;
				
				case GAMEOVER:
					var boardProxy:BoardProxy = BoardProxy(notification.getBody())
					if (boardProxy is CPUBoardProxy) {
						trace("Player wins")
						drawWinnerLabel(boardProxy)
					}
			
					else {
						trace("CPU wins")
						drawWinnerLabel(boardProxy)
					}
				break;
				
				default:
			}

		}
		
		private function drawWinnerLabel(boardProxy:BoardProxy):void {
				var winner:String, winnerLabel:TextField = new TextField;
				
				CPUBoardView.removeEventListener(ClickGridEvent.CLICKGRIDEVENT, gridClicked)
				
				if (boardProxy is CPUBoardProxy)
					winner = playerProxy.vo.name;
					else
						winner = 'CPU'

				winnerLabel.backgroundColor = uint(Globals.lightBlue.substr(1));
				winnerLabel.width = Globals.HEXWIDTH*10
				winnerLabel.x = (950-winnerLabel.width)/2;
				winnerLabel.y = Globals.HEXWIDTH*(boardProxy.vo.size+2)
				winnerLabel.defaultTextFormat = Globals.labelFormat;
				winnerLabel.text = winner+" won!";
				viewComponent.addChild(winnerLabel);
		}
		
		private function get playerBoardProxy():BoardProxy
		{
			return facade.retrieveProxy(PlayerBoardProxy.NAME) as BoardProxy;
		}
		
		private function get playerProxy():PlayerProxy
		{
			return facade.retrieveProxy(PlayerProxy.NAME) as PlayerProxy;
		}
		
		private function get cPUBoardProxy():BoardProxy
		{
			return facade.retrieveProxy(CPUBoardProxy.NAME) as BoardProxy;
		}
	}

}