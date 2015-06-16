package view.views
{
	import flash.display.Shape;
	import flash.display.Sprite;
	
	/**
	 * Deseneaza un board
	 * scrie functia de desenare, accepta input pentru plasarea avioanelor si pentru hit
	 * @author gh
	 */
	public class BoardView extends Sprite
	{
		public static const NAME:String = "Board View";
		

		
		public function BoardView() 
		{
			super();
		}
		
		public function display(map:Array, size:int):void
		{
			for (var i:int = 0; i < size; i++)
			{
				for (var j:int = 0; j < size; j++)
				{
					var rectangle:Shape = new Shape; // initializing the variable named rectangle
					
					//schimba culoarea in functie de ce e pe tile
					switch (map[i][j]) 
					{
						//tile e gol
						case 0:
							rectangle.graphics.beginFill(uint("0x" + Globals.lightBlue.substr(1)));
						break;
						
						//tile e un avion mort
						case 999:
							rectangle.graphics.beginFill(0x800000);
						break;
						
						default:
						rectangle.graphics.beginFill(uint(Globals.planeColor));
					}
					rectangle.graphics.lineStyle(1, 0x000000);
					rectangle.graphics.drawRect(Globals.HEXWIDTH*(1+i), Globals.HEXWIDTH*(1+j), Globals.HEXWIDTH, Globals.HEXWIDTH); // (x spacing, y spacing, width, height)
					rectangle.graphics.endFill(); // not always needed but I like to put it in to end the fill
					addChild(rectangle); // adds the rectangle to the stage
				}
			}
		}
	
	}

}