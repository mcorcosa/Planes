package controller 
{
	import flash.events.DataEvent;
	import model.BoardProxy;
	import model.DataProxy;
	import model.PlaneFactory;
	import model.PlayerBoardProxy;
	import model.PlayerProxy;
	import model.VO.PlaneVO;
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * Se ocupa de plasarea avioanelor pe board-ul unui jucator
	 * TODO: refactor pentru ca tot procesul de setup sa il execut cu un macro command
	 * @author gh
	 */
	public class PlacePlanesCommand extends SimpleCommand implements ICommand
	{	
		override public function execute(notification:INotification):void
		{
			var Factory:PlaneFactory = new PlaneFactory;
			var sizes:Array = dataProxy.getPlaneSizes();
			var shapes:Array = dataProxy.getPlaneShapes();
			var planeToPlace:PlaneVO;
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			var posx:int = body.x, posy:int = body.y, rotation:int = 0;
			var boardProxy:BoardProxy = body.boardProxy;
			
			//creeaza avionul
			planeToPlace = Factory.createPlane(sizes[boardProxy.vo.planes], shapes[boardProxy.vo.planes]);
			
			//testeaza ca avionul sa nu depaseasca marginile
				if (posx <= boardProxy.getBoardSize()-planeToPlace.size) {
					if (posy <= boardProxy.getBoardSize()-planeToPlace.size) {

						//TODO:testeaza daca avionul nu se suprapune cu altele
						planeToPlace.rotate(rotation);
						placePlane(planeToPlace, posx, posy)
						boardProxy.addPlane(posx, posy, planeToPlace);	
					}
					else {
						trace("Pozitie incorecta, obtine coordonate noi");
					}
					}
				else {
						trace("Pozitie incorecta, obtine coordonate noi");
				}
			
			//testeaza daca au fost puse toate avioanele
			if (boardProxy.vo.planes >= Globals.NUMBER_OF_PLANES) {
					trace("Avioanele au fost adaugate");
					//TODO: adauga avioanele pentru CPU
			}
				
			/*while (playerProxy.getNumberOfPlanes()<Globals.NUMBER_OF_PLANES) 
			{
				//creeaza primul avion
				
								
				//pune userul sa introduca pozitia si rotatia
				posx = body.x; posy = body.y;
				
				
				else
					trace("Pozitie incorecta, obtine coordonate noi");
			}*/
		}
		
		private function placePlane(plane:PlaneVO, posx:int, posy: int):void {
			
		}

		private function get dataProxy():DataProxy
		{
			return facade.retrieveProxy(DataProxy.NAME) as DataProxy;
		}

		private function get playerProxy():PlayerProxy
		{
			return facade.retrieveProxy(PlayerProxy.NAME) as PlayerProxy;
		}
		
	}

}