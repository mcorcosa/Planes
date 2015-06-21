package controller 
{
	import model.BoardProxy;
	import model.CPUBoardProxy;
	import model.PlaneSetProxy;
	import model.PlayerBoardProxy;
	import model.VO.Coords;
	import model.VO.PlaneVO;
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * handles the preparation of CPU's board
	 * @author gh
	 */
	public class CPUSetupCommand extends SimpleCommand implements ICommand 
	{
		public static const NAME:String = "CPUSetupCommand"
		public static const PLACE:String = NAME + 'PLACE';

		
		public function CPUSetupCommand() 
		{
			super();
			
		}
		
		override public function execute(notification:INotification):void 
		{
			var name:String = notification.getName();
			var body:Object = notification.getBody();

			//testeaza daca e plina tabla Player sau a CPU
			if (body is PlayerBoardProxy) {
				PlacePlanes(cPUBoardProxy)
			}
			//else sendNotification (STARTGAME);
		}
		
		private function PlacePlanes(boardProxy:BoardProxy):void {
			
			while (cPUBoardProxy.vo.planes < Globals.NUMBER_OF_PLANES) {
				
				//get random coordinates and rotation
				var x:int, y:int, rotations:int;
				x = randomRange(0, boardProxy.vo.size);
				y = randomRange(0, boardProxy.vo.size);
				rotations = randomRange(0, 16);
				trace("the random coords are" + x + " " + y)
			
				//create and rotate the plane to be placed
				var planeToPlace:PlaneVO;
				planeToPlace=planeSetProxy.vo.collection[cPUBoardProxy.vo.planes]
				for (var i:int = 0; i < rotations; i++) 
				{
					planeToPlace.rotate(90);
				}
				
				var coords:Coords = new Coords(x, y, cPUBoardProxy, planeToPlace);
				sendNotification(PLACE, coords);
				planeToPlace = planeSetProxy.vo.collection[cPUBoardProxy.vo.planes]
			}
			
			//generate a random number
			function randomRange(minNum:int, maxNum:int):int 
				{
					return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
				}
		}
		
		private function get cPUBoardProxy():BoardProxy
		{
			return facade.retrieveProxy(CPUBoardProxy.NAME) as CPUBoardProxy;
		}
		
		private function get planeSetProxy():PlaneSetProxy {
			return facade.retrieveProxy(PlaneSetProxy.NAME) as PlaneSetProxy;
		}
	}

}