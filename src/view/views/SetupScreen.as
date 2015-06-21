package view.views
{
	import events.ClickGridEvent;
	import events.RotationEvent;
	import flash.display.Shape;
	import flash.display.SimpleButton;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.ui.Mouse;
	import model.VO.PlaneVO;
	
	/**
	 * Displays a screen for placing Player's planes onto the board
	 * @author gh
	 */
	public class SetupScreen extends Sprite
	{
		public static const NAME:String = " Setup Screen";
		public static const CLICKGRIDEVENT:String = " Click grid Event";
		public static const PLACE:String = " Place plane";
		public static const ROTATE:String = " ROTATE"
		
		public function display(map:Array, size:int):void
		{
			for (var i:int = 0; i < size; i++)
			{
				for (var j:int = 0; j < size; j++)
				{
					var rectangle:SimpleButton = new SimpleButton;
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
					tileButtonSprite.graphics.drawRect(Globals.HEXWIDTH * (1 + i), Globals.HEXWIDTH * (1 + j), Globals.HEXWIDTH, Globals.HEXWIDTH); // (x spacing, y spacing, width, height)
					tileButtonSprite.graphics.endFill();
					rectangle.addEventListener(MouseEvent.CLICK, tileClicked);
					rectangle.addEventListener(MouseEvent.MOUSE_WHEEL, rotate);
					rectangle.overState = rectangle.downState = rectangle.upState = rectangle.hitTestState = tileButtonSprite;
					
					addChild(rectangle);
				}
			}
		}
		
		public function tileClicked(e:MouseEvent):void
		{
			var y:int = (stage.mouseX - Globals.HEXWIDTH) / Globals.HEXWIDTH
			var x:int = (stage.mouseY - Globals.HEXWIDTH) / Globals.HEXWIDTH
			//trace ("player clicked " +x + " " + y);  
			dispatchEvent(new ClickGridEvent(CLICKGRIDEVENT, x, y, true));
		}
		
		public function rotate(e:MouseEvent):void
		{
			dispatchEvent(new RotationEvent(ROTATE));
		}
	}
}