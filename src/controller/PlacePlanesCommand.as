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
		public static const NAME:String = 'PlacePlanesCommand ';
		public static const BOARDFULL:String = 'Board full';
		public static const INCORRECT:String = 'Incorrect'
	 
		override public function execute(notification:INotification):void
		{
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			var posx:int = body.x, posy:int = body.y, planeToPlace:PlaneVO = body.planeToPlace;
			var boardProxy:BoardProxy = body.boardProxy;
			var okToPlace:Boolean = true;
			
			
			//creeaza avionul
			//planeToPlace = Factory.createPlane(sizes[boardProxy.vo.planes], shapes[boardProxy.vo.planes]);
			
			//testeaza ca avionul sa nu depaseasca marginile
				if (posx <= boardProxy.getBoardSize()-planeToPlace.size) {
					if (posy <= boardProxy.getBoardSize()-planeToPlace.size) {
						//testeaza daca avionul nu se suprapune cu altele
						for (var i:int = posy; i < planeToPlace.size+posy; i++) 
						{
							for (var j:int = posx; j < planeToPlace.size+posx; j++) 
							{
								if (boardProxy.vo.map[i][j] == 1 && planeToPlace.map[j - posx][i - posy] == 1) {
								sendNotification(INCORRECT)	
								okToPlace = false;}
							}
						}
						
					}
					else {
						sendNotification(INCORRECT)
						okToPlace = false;
					}
					}
				else {
						sendNotification(INCORRECT)
						okToPlace = false;
				}
				
			if (okToPlace==true) {
				placePlane(planeToPlace, posx, posy)
				boardProxy.addPlane(posx, posy, planeToPlace);
			}
			
			//testeaza daca au fost puse toate avioanele
			if (boardProxy.vo.planes >= Globals.NUMBER_OF_PLANES) {
				trace("Avioanele au fost adaugate");
				sendNotification(BOARDFULL, boardProxy)
			}
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