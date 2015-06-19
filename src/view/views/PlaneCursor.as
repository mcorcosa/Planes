package view.views 
{
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
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
			/*for (var i:int = 0; i < mapSize-1; i++ )
			{
				for (var j:int = 0; j < mapSize-1; i++)
				{
					var rectangle:SimpleButton = new SimpleButton;
					var tileButtonSprite:Sprite = new Sprite();
				
					//schimba culoarea in functie de ce e pe tile
					switch (map[i][j]) 
					{
						//tile e gol
						case 0:
							tileButtonSprite.graphics.beginFill(uint("0x" + Globals.lightBlue.substr(1)));
						break;
						
						//tile e un avion mort
						case 999:
							tileButtonSprite.graphics.beginFill(0x800000);
						break;
						
						default:
						tileButtonSprite.graphics.beginFill(uint(Globals.planeColor));
					}
					
					tileButtonSprite.graphics.lineStyle(1, 0x000000);
					tileButtonSprite.graphics.drawRect(Globals.HEXWIDTH*(1+i), Globals.HEXWIDTH*(1+j), Globals.HEXWIDTH, Globals.HEXWIDTH); // (x spacing, y spacing, width, height)
					tileButtonSprite.graphics.endFill(); 
					//rectangle.addEventListener(MouseEvent.CLICK, tileClicked);
					rectangle.overState = rectangle.downState = rectangle.upState = rectangle.hitTestState = tileButtonSprite;

					stage.addChild(rectangle); // adds the rectangle to the stage
				}
			}*/
			this.width = Globals.HEXWIDTH * mapSize;
			this.height = Globals.HEXWIDTH * mapSize;
			this.graphics.beginFill(uint(Globals.planeColor));
			this.graphics.drawRect(0, 0, Globals.HEXWIDTH * mapSize, Globals.HEXWIDTH * mapSize); // (x spacing, y spacing, width, height)
			this.graphics.endFill(); 
		}

	}

}