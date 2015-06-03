package view.views 
{
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * ...
	 * @author gh
	 */
	public class IntroScreen extends Sprite
	{
		public static const NAME:String = "IntroScreen";
		public static const SHOW:String = NAME+"Show"
		public static const START:String = NAME+"Start";
		
		public var textField:TextField;
		public var startButton:SimpleButton;
		
		public function display():void {
			textField = new TextField;
			startButton = new SimpleButton;
			var startButtonSprite = new Sprite();
			startButtonSprite.graphics.lineStyle(1, 0x555555);
			startButtonSprite.graphics.beginFill(0xff000,1);
			startButtonSprite.graphics.drawRect(0,0,200,30);
			startButtonSprite.graphics.endFill();
			startButton.overState = startButton.downState = startButton.upState = startButton.hitTestState = startButtonSprite;
		}
		
	}

}