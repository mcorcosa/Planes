package view.views 
{
	import flash.display.Sprite;
	/**
	 * Deseneaza un board
	 * TODO: scrie functia de desenare, accepta input pentru plasarea avioanelor si pentru hit
	 * @author gh
	 */
	public class BoardView {
		public static const NAME:String = "Board View";
		public static const DISPLAY:String = NAME + "Show"
		
		private var grid:Sprite = new Sprite();
		
		public function drawBoard(numColumns:Number, numRows:Number, cellHeight:Number, cellWidth:Number, grid:Sprite):void 
		{
			grid.graphics.clear();
			grid.graphics.lineStyle(1, 0x000000);

			// we drop in the " + 1 " so that it will cap the right and bottom sides.
			for (var col:Number = 0; col < numColumns + 1; col++)
			{
				for (var row:Number = 0; row < numRows + 1; row++)
				{
					trace(col, row);
					grid.graphics.moveTo(col * cellWidth, 0);
					grid.graphics.lineTo(col * cellWidth, cellHeight * numRows);
					grid.graphics.moveTo(0, row * cellHeight);
					grid.graphics.lineTo(cellWidth * numColumns, row * cellHeight);
				}
			}
			addchild(grid);
		}
		
	}

}