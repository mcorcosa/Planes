package view.views
{
	import events.ClickGridEvent;
	import flash.display.Shape;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import model.BoardProxy;
	import model.PlayerBoardProxy;
	import model.PlayerProxy;
	
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
			
			while (this.numChildren > 0) {
				this.removeChildAt(0);
			}
			
			if(boardProxy is PlayerBoardProxy){
				
				for (var i:int = 0; i < size; i++)
				{			
					for (var j:int = 0; j < size; j++)
					{
						var rectangle:Shape = new Shape; // initializing the variable named rectangle

						//change tile color according to BoardVO's map
						switch (map[i][j]) 
						{
							case 0: 
							rectangle.graphics.beginFill(uint("0x" + Globals.lightBlue.substr(1)));
							break;
							
							case 999: 
							rectangle.graphics.beginFill(0x000000);
							break;
						
							case 1000:
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
				
				//add a label under the board
				var playerLabel:TextField = new TextField;
				playerLabel.width = Globals.HEXWIDTH*10
				playerLabel.x = (Globals.HEXWIDTH*boardProxy.vo.size-playerLabel.width)/2;
				playerLabel.y = Globals.HEXWIDTH*(boardProxy.vo.size+2)
				playerLabel.defaultTextFormat = Globals.labelFormat;
				playerLabel.text = "Your planes. Remaining: "+boardProxy.vo.planes;
				addChild(playerLabel);
			}
			else 
			{
				for (var k:int = 0; k < size; k++)
			{

				for (var l:int = 0; l < size; l++)
				{
					
					var CPUrectangle:SimpleButton = new SimpleButton;
					var tileButtonSprite:Sprite = new Sprite();
					switch (map[k][l])
					{
						case 0: 
							tileButtonSprite.graphics.beginFill(uint("0x" + Globals.lightBlue.substr(1)));
							break;
							
						case 999: 
							tileButtonSprite.graphics.beginFill(0x000000);
							break;
						
						case 1000:
							tileButtonSprite.graphics.beginFill(0x800000);
							break;
						
						default: 
							//tileButtonSprite.graphics.beginFill(uint(Globals.planeColor)); FOR TESTING PURPOSES ONLY!
							tileButtonSprite.graphics.beginFill(uint("0x" + Globals.lightBlue.substr(1)));
					}
					
					tileButtonSprite.graphics.lineStyle(1, 0x000000);
					tileButtonSprite.graphics.drawRect(Globals.HEXWIDTH * (1 + k)+Globals.HEXWIDTH*25, Globals.HEXWIDTH * (1 + l), Globals.HEXWIDTH, Globals.HEXWIDTH); // (x spacing, y spacing, width, height)
					tileButtonSprite.graphics.endFill();
					CPUrectangle.addEventListener(MouseEvent.CLICK, tileClicked);
					CPUrectangle.overState = CPUrectangle.downState = CPUrectangle.upState = CPUrectangle.hitTestState = tileButtonSprite;
					addChild(CPUrectangle);
				}
			}
			//add a label under the board
				var CPULabel:TextField = new TextField;
				CPULabel.width = Globals.HEXWIDTH*10
				CPULabel.x = (Globals.HEXWIDTH*boardProxy.vo.size-CPULabel.width)/2+Globals.HEXWIDTH*25;
				CPULabel.y = Globals.HEXWIDTH*(boardProxy.vo.size+2)
				CPULabel.defaultTextFormat = Globals.labelFormat;
				CPULabel.text = "CPU planes. Remaining: "+boardProxy.vo.planes;
				addChild(CPULabel);
			}
		function tileClicked(e:MouseEvent):void
			{
				var y:int = (stage.mouseX - Globals.HEXWIDTH- Globals.HEXWIDTH*25) / Globals.HEXWIDTH
				var x:int = (stage.mouseY - Globals.HEXWIDTH) / Globals.HEXWIDTH
				//trace ("player clicked " +x + " " + y);  
				dispatchEvent(new ClickGridEvent(CLICKGRIDEVENT, x, y, true));
			}
		}
	}

	 
}