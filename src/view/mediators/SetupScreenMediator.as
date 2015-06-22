package view.mediators 
{
	import controller.PlacePlanesCommand;
	import events.ClickGridEvent;
	import events.RotationEvent;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormatAlign;
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
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import view.views.PlaneCursor;
	import view.views.SetupScreen;
	
	/**
	 * Handles the UI elements used for setting up the board prior to starting the game
	 * TODO: refactor the spaghetti (possibly a new command to use this mediator and implement the business logic)
	 * @author gh
	 */
	public class SetupScreenMediator extends Mediator implements IMediator 
	{
		
		public static const NAME:String = " SetupScreenMediator";
		public static const PLACE:String = " Place"
		public static const CLICKGRIDEVENT:String = " Click grid Event";
		public static const INCORRECT:String  = "Incorrect"
		public static const STARTGAME:String = 'Start Game'
		
		private var SS:SetupScreen;
		public var cursor:PlaneCursor;
		public var planeToPlace:PlaneVO
		public var textField:TextField = new TextField();
		
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
			SS.display(playerBoardProxy.vo.map, playerBoardProxy.getBoardSize())
			
			this.SS.addEventListener(RotationEvent.ROTATE, rotate)
			
			//create the plane to be added (to be used only for drawing the cursor)
			planeToPlace=planeSetProxy.vo.collection[playerBoardProxy.vo.planes]
			
			//create custom cursor and add it to stage
			cursor = new PlaneCursor(planeToPlace.map, planeToPlace.size);
			SS.addEventListener(MouseEvent.MOUSE_MOVE, redrawCursor); 
			
			
			
			textField.width = 200; 
			textField.x = (Globals.HEXWIDTH*playerBoardProxy.vo.size-textField.width)/2;
			textField.y = Globals.HEXWIDTH*playerBoardProxy.vo.size+20
			textField.defaultTextFormat = Globals.smallFormat;
			textField.text = "Place your planes \n Use mouse wheel to rotate";

			viewComponent.addChild(textField);
			
			for (var i:int = 0; i < planeToPlace.size; i++)
			{
				for (var j:int = 0; j < planeToPlace.size; j++)
				{
					var cursorTile:Sprite = new Sprite();
				
					//change the tile color, according to the plane's map
					switch (playerBoardProxy.vo.map[i][j]) 
					{
						//tile is empty
						case 1:
							cursorTile.graphics.beginFill(uint(Globals.planeColor));
						break;
						
						default:
						//cursorTile.graphics.beginFill(uint(Globals.lightBlue));
					}
					cursorTile.graphics.drawRect(Globals.HEXWIDTH*+i, Globals.HEXWIDTH*j, Globals.HEXWIDTH, Globals.HEXWIDTH); // (x spacing, y spacing, width, height)
					cursorTile.graphics.endFill(); 

					cursor.addChild(cursorTile); // adds the cursorTile to the cursor
				}	
			}
			
			viewComponent.addChild(cursor);
			
			cursor.draw(planeToPlace.map)
			Mouse.hide(); 
			
			 
			function redrawCursor(event:MouseEvent):void 
			{ 
				cursor.x = event.stageX; 
				//trace(event.stageX)
				cursor.y = event.stageY; 
				//trace(event.stageY)
			}
			
			//TODO: allow counter clockwise rotation
			
			//handle rotation
			SS.addEventListener(RotationEvent.ROTATE, rotate); 
		}
				
		public function rotate(e:MouseEvent):void {
			planeToPlace.rotate(90);
			cursor.draw(planeToPlace.map)
			cursor.draw(planeToPlace.map)
		}
		
		public function gridClicked(e:ClickGridEvent):void {
			trace("Click at " + e.x + " " + e.y);
			var coords:Coords = new Coords(e.x, e.y, playerBoardProxy, planeToPlace);
			sendNotification(PLACE, coords);
			planeToPlace = planeSetProxy.vo.collection[playerBoardProxy.vo.planes]
			if(planeToPlace){
				cursor.width = Globals.HEXWIDTH * planeToPlace.size;
				cursor.height = Globals.HEXWIDTH * planeToPlace.size;
				cursor.mapSize = planeToPlace.size;
				while (cursor.numChildren > 0) {
					cursor.removeChildAt(0);
					}
				cursor.draw(planeToPlace.map)		
				cursor.draw(planeToPlace.map)
			}			
			SS.display(playerBoardProxy.vo.map, playerBoardProxy.getBoardSize())
			
		}
		
		override public function listNotificationInterests():Array
		{
			return [PlacePlanesCommand.BOARDFULL, PlacePlanesCommand.INCORRECT]
		}
		
		override public function handleNotification(notification:INotification):void
		{
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			
			switch (name)
			{
				case PlacePlanesCommand.BOARDFULL: 
					//if playerboard is full, hide setupscreen and other children
					if (body is PlayerBoardProxy) {
						viewComponent.removeChild(SS)
						viewComponent.removeChild(cursor)
						viewComponent.removeChild(textField)
						Mouse.show()
					}
					
					else
					sendNotification(STARTGAME, viewComponent)
					break;
					
				case PlacePlanesCommand.INCORRECT:
					trace("Incorrect coordinates, cannot place here");
					textField.text="Cannot place here"
					break;
			}
		}
		
		
		private function get playerBoardProxy():BoardProxy
		{
			return facade.retrieveProxy(PlayerBoardProxy.NAME) as PlayerBoardProxy;
		}
		
		private function get planeSetProxy():PlaneSetProxy {
			return facade.retrieveProxy(PlaneSetProxy.NAME) as PlaneSetProxy;
		}
	}

}