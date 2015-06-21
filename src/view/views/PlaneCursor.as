package view.views 
{
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * Cursor that resembles the plane to be placed, used in placing Player's planes
	 * @author gh
	 */
	public class PlaneCursor extends Sprite 
	{
		public var map:Array;
		public var mapSize:int;
		public static const NAME:String = " Setup Screen";
		
		public function PlaneCursor(omap:Array, size:int) 
		{
			this.map = omap;
			this.mapSize = size;
			super();
			
		}
		
		public function draw(map:Array):void 
		{
			
			this.width = Globals.HEXWIDTH * mapSize;
			this.height = Globals.HEXWIDTH * mapSize;

			
				while (this.numChildren > 0) {
				this.removeChildAt(0);
			}
			
			for (var i:int = 0; i < mapSize; i++)
			{
				for (var j:int = 0; j < mapSize; j++)
				{
					var cursorTile:Sprite = new Sprite();

					switch (map[j][i]) 
					{
						case 1:
							cursorTile.graphics.beginFill(uint(Globals.planeColor));
						break;
						
						default:
					}
					cursorTile.graphics.drawRect(Globals.HEXWIDTH*+i, Globals.HEXWIDTH*j, Globals.HEXWIDTH, Globals.HEXWIDTH); // (x spacing, y spacing, width, height)
					cursorTile.graphics.endFill(); 

					this.addChild(cursorTile); 
				}	
			}
			
		}

	}

}