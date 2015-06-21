package view.views
{
	import events.ClickGridEvent;
	import flash.display.Shape;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import model.BoardProxy;
	import model.PlayerBoardProxy;
	
	/**
	 * Draws a board according to the BoardVO's map
	 * @author gh
	 */
	public class BoardView extends Sprite
	{
		public static const NAME:String = "Board View";
		public static const CLICKGRIDEVENT:String = " Click grid Event";
		
		public var boardProxy:BoardProxy;

		
		public function BoardView(boardProxy:BoardProxy) 
		{
			this.boardProxy = boardProxy;
			super();
		}
		
		public function display():void
		{
			var map:Array = boardProxy.vo.map;
			var size:int = boardProxy.vo.size;
			
			if(boardProxy is PlayerBoardProxy){
				
				for (var i:int = 0; i < size; i++)
				{
					for (var j:int = 0; j < size; j++)
					{
						var rectangle:Shape = new Shape; // initializing the variable named rectangle
						
						//change tile color according to BoardVO's map
						switch (map[i][j]) 
						{
							//tile is empty
							case 0:
								rectangle.graphics.beginFill(uint("0x" + Globals.lightBlue.substr(1)));
							break;
							
							//tile is a dead plane
							case 999:
								rectangle.graphics.beginFill(0x800000);
							break;
							
							//plane is present
							default:
							rectangle.graphics.beginFill(uint(Globals.planeColor));
						}
						rectangle.graphics.lineStyle(1, 0x000000);
						rectangle.graphics.drawRect(Globals.HEXWIDTH*(1+i), Globals.HEXWIDTH*(1+j), Globals.HEXWIDTH, Globals.HEXWIDTH); // (x spacing, y spacing, width, height)
						rectangle.graphics.endFill(); 
						addChild(rectangle);
					}
				}
			}
			else 
			{
				for (var i:int = 0; i < size; i++)
			{
				for (var j:int = 0; j < size; j++)
				{
					var CPUrectangle:SimpleButton = new SimpleButton;
					var tileButtonSprite:Sprite = new Sprite();

					switch (map[i][j])
					{
						case 0: 
							tileButtonSprite.graphics.beginFill(uint("0x" + Globals.lightBlue.substr(1)));
							break;
							
						case 999: 
							tileButtonSprite.graphics.beginFill(0x800000);
							break;
						
						default: 
							tileButtonSprite.graphics.beginFill(uint(Globals.planeColor));
					}
					
					tileButtonSprite.graphics.lineStyle(1, 0x000000);
					tileButtonSprite.graphics.drawRect(Globals.HEXWIDTH * (1 + i)+Globals.HEXWIDTH*25, Globals.HEXWIDTH * (1 + j), Globals.HEXWIDTH, Globals.HEXWIDTH); // (x spacing, y spacing, width, height)
					tileButtonSprite.graphics.endFill();
					CPUrectangle.addEventListener(MouseEvent.CLICK, tileClicked);
					CPUrectangle.overState = CPUrectangle.downState = CPUrectangle.upState = CPUrectangle.hitTestState = tileButtonSprite;
					addChild(CPUrectangle);
				}
			}
			}
		function tileClicked(e:MouseEvent):void
			{
				var y:int = (stage.mouseX - Globals.HEXWIDTH+Globals.HEXWIDTH*25) / Globals.HEXWIDTH
				var x:int = (stage.mouseY - Globals.HEXWIDTH+Globals.HEXWIDTH*25) / Globals.HEXWIDTH
				//trace ("player clicked " +x + " " + y);  
				dispatchEvent(new ClickGridEvent(CLICKGRIDEVENT, x, y, true));
			}
		}
	}

}