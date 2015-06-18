package view.mediators 
{
	import events.ClickGridEvent;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import model.BoardProxy;
	import model.DataProxy;
	import model.PlaneFactory;
	import model.PlaneSetProxy;
	import model.PlayerBoardProxy;
	import model.VO.Coords;
	import model.VO.PlaneVO;
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import view.views.PlaneCursor;
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
		public var cursor:PlaneCursor;
		var planeToPlace:PlaneVO
		
		public function SetupScreenMediator(mediatorName:String = null, viewComponent:Object = null)
		{
			super(mediatorName, viewComponent);
		}
		
		override public function onRegister():void
		{
			//create the setup screen
			trace(" SetupScreenMediator registered");
			SS = new SetupScreen;
			this.SS.addEventListener(ClickGridEvent.CLICKGRIDEVENT, gridClicked);
			viewComponent.addChild(SS);
			planeToPlace=planeSetProxy.vo.collection[playerBoardProxy.vo.planes]
			
			//create custom cursor and add it to stage
			cursor = new PlaneCursor(planeToPlace.map, planeToPlace.size);
			
			viewComponent.addChild(cursor);
			cursor.width = Globals.HEXWIDTH * planeToPlace.size/3;
			cursor.height = Globals.HEXWIDTH * planeToPlace.size/3;
			cursor.graphics.beginFill(uint(Globals.planeColor));
			cursor.graphics.drawRect(0, 0, Globals.HEXWIDTH * planeToPlace.size, Globals.HEXWIDTH * planeToPlace.size); // (x spacing, y spacing, width, height)
			cursor.graphics.endFill(); 
			SS.addEventListener(MouseEvent.MOUSE_MOVE,redrawCursor); 
			Mouse.hide(); 
			 
			function redrawCursor(event:MouseEvent):void 
			{ 
				cursor.x = event.stageX/15*15; 
				trace(event.stageX)
				cursor.y = event.stageY/15*15; 
				trace(event.stageY)
			}

			
			//
			SS.display(playerBoardProxy.vo.map, playerBoardProxy.getBoardSize())
		}
		
		public function gridClicked(e:ClickGridEvent):void {
			trace(" mediator got click"+ e.x + " "+ e.y)
			var coords:Coords = new Coords(e.x, e.y, playerBoardProxy);
			sendNotification(PLACE, coords);
			cursor.width = Globals.HEXWIDTH * planeToPlace.size;
			cursor.height = Globals.HEXWIDTH * planeToPlace.size;
			cursor.graphics.beginFill(uint(Globals.planeColor));
			cursor.graphics.drawRect(0, 0, Globals.HEXWIDTH * planeToPlace.size, Globals.HEXWIDTH * planeToPlace.size); // (x spacing, y spacing, width, height)
			cursor.graphics.endFill(); 
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
		
		private function get planeSetProxy():PlaneSetProxy {
			return facade.retrieveProxy(PlaneSetProxy.NAME) as PlaneSetProxy;
		}
	}

}