package controller
{
	import model.BoardProxy;
	import model.CPUBoardProxy;
	import model.PlayerBoardProxy;
	import model.VO.Coords;
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * ...
	 * @author gh
	 */
	public class ShootCommand extends SimpleCommand implements ICommand
	{
		public static const NAME:String = "ShootCommand"
		public static const SHOOT:String = "Shoot"
		public static const UPDATE:String = "Update"
		public static const GAMEOVER:String = "GameOver"
		
		public function ShootCommand()
		{
			super();
		
		}
		
		/* INTERFACE org.puremvc.as3.interfaces.ICommand */
		
		override public function execute(notification:INotification):void
		{
			var coords:Coords = Coords(notification.getBody());
			var x:int, y:int, boardProxy:BoardProxy;
			x = coords.x;
			y = coords.y;
			boardProxy = coords.boardProxy;
			
			trace("Shot at " + x + " " + y)
			
			if (boardProxy.vo.map[x][y] > 0 && boardProxy.vo.map[x][y] < 999)
			{
				trace("Hit!")
				
				trace(boardProxy.vo.planes + " Planes remaining")
				var hitPlaneID:int = boardProxy.vo.map[x][y]
				boardProxy.vo.map[x][y] = 999;
				
				//check if plane is dead
				var planeIsDead:Boolean = true
				for (var i:int = 0; i < boardProxy.vo.size; i++)
				{
					for (var j:int = 0; j < boardProxy.vo.size; j++)
					{
						if (boardProxy.vo.map[i][j] == hitPlaneID)
						{
							planeIsDead = false;
						}
					}
				}
				if (planeIsDead == true)
					boardProxy.vo.planes--;
					testGameOver()
				if (boardProxy is PlayerBoardProxy)
				{
					var CPUcoords:Coords = new Coords(randomRange(0, 19), randomRange(0, 19), playerBoardProxy, null)
					sendNotification(SHOOT, CPUcoords)
					sendNotification(UPDATE)
				}
			}
			
			else
			{
				if (boardProxy.vo.map[x][y] == 0 || boardProxy.vo.map[x][y] == 1000)
					boardProxy.vo.map[x][y] = 1000;
				trace("miss")
				if (boardProxy is CPUBoardProxy)
				{
					var CPUcoords:Coords = new Coords(randomRange(0, 19), randomRange(0, 19), playerBoardProxy, null)
					sendNotification(SHOOT, CPUcoords)
					sendNotification(UPDATE)
				}
			}
			function testGameOver():void
			{
				if (boardProxy.vo.planes == 0)
				{
					trace("gameover")
					sendNotification(GAMEOVER, boardProxy)
				}
			}
		}	
			
			
			
			//generate a random number
			private function randomRange(minNum:int, maxNum:int):int
			{
				return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
			}
			
			private function get playerBoardProxy():BoardProxy
			{
				return facade.retrieveProxy(PlayerBoardProxy.NAME) as PlayerBoardProxy;
			}
		}
	
	}