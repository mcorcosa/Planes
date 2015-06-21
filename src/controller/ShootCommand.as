package controller 
{
	import model.BoardProxy;
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
			
			trace("Shot at "+x+" "+y)
			
			if (boardProxy.vo.map[x][y] > 0 && boardProxy.vo.map[x][y] < 999){
				trace("Hit!")
				var hitPlaneID:int=boardProxy.vo.map[x][y]
				for (var i:int = 0; i < boardProxy.vo.size; i++) 
				{
					for (var j:int = 0; j < boardProxy.vo.size; j++) 
						{
							if (boardProxy.vo.map[i][j] == hitPlaneID) {
								boardProxy.vo.map[i][j] = 999;
							}
						}
				}
			}
			
			else {
				boardProxy.vo.map[x][y] = 1000;
				trace("Miss!")
			}
			
		}
		
	}

}