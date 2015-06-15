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
	 * ...
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
			var posx:int=0, posy:int=0, rotation:int=0;
			
			while (playerProxy.getNumberOfPlanes()<Globals.NUMBER_OF_PLANES) 
			{
				//creeaza primul avion
				planeToPlace = Factory.createPlane(sizes[playerProxy.getNumberOfPlanes()], shapes[playerProxy.getNumberOfPlanes()]);
				
				//pune userul sa introduca pozitia si rotatia
				posx = 17; posy = 10;
				
				//testeaza ca avionul sa nu depaseasca marginile
				if (posx >= 0 && posx <= playerBoardProxy.getBoardSize()) {
					if (posy >= 0 && posy <= playerBoardProxy.getBoardSize()) {
						//TODO:testeaza daca avionul nu se suprapune cu altele
						planeToPlace.rotate(rotation);
						placePlane(planeToPlace, posx, posy)
						trace("Avionul cu id " + playerProxy.getNumberOfPlanes() + ", Size " + planeToPlace.size + ", Shape " + planeToPlace.shape + ", depus pe board "+notification.getBody()+", la pozitia "+posx+"  "+posy);
						playerProxy.addPlane();
					}
					else {
						trace("Pozitie incorecta, obtine coordonate noi");
					}
				}
				else
					trace("Pozitie incorecta, obtine coordonate noi");
			}
		}
		
		private function placePlane(plane:PlaneVO, posx:int, posy: int):void {
			
		}

		private function get playerBoardProxy():BoardProxy
		{
			return facade.retrieveProxy(PlayerBoardProxy.NAME) as PlayerBoardProxy;
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