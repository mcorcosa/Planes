package view.mediators 
{
	import controller.StartSetupCommand;
	import model.PlayerBoardProxy;
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import view.views.BoardView;
	
	/**
	 * Mediator pentru BoardView
	 * @author gh
	 */
	public class BoardViewMediator extends Mediator implements IMediator 
	{
		public static const NAME:String = "BoardViewMediator";
		
		
		private var BV:BoardView;
		
		public function BoardViewMediator(mediatorName:String = null, viewComponent:Object = null)
		{
			super(mediatorName, viewComponent);
		}
		
		override public function onRegister():void
		{
			BV = new BoardView;
			trace(" BoardViewMediator registered");
			viewComponent.addChild(BV);
		}
		
		override public function listNotificationInterests():Array
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
						BV.display(body.getBoardMap(), body.getBoardSize());
					}
			}
		}
	}

}