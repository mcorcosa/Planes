package view.views
{
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.TextEvent;
	import flash.text.*;
	
	/**
	 * Afiseaza un IntroScreen - background + textbox pentru player name + buton de start
	 * executa comanda StartGame
	 * TODO: adauga functionalitate la textbox si buton
	 * TODO: adauga background si repara aspectul la buton si textbox
	 * @author gh
	 */
	public class IntroScreen extends Sprite
	{
		public static const NAME:String = "IntroScreen";
		public static const DISPLAY:String = NAME + "Show"
		public static const START:String = NAME + "Start";
		
		public var textBox:TextField;
		public var startButton:SimpleButton;
		
		public function display():void
		{
			textBox = new TextField;
			startButton = new SimpleButton;
			
			//aspect startButton 
			var startButtonSprite:Sprite = new Sprite();
			startButtonSprite.graphics.lineStyle(1, 0x555555);
			startButtonSprite.graphics.beginFill(0xff000, 1);
			startButtonSprite.graphics.drawRect(0, 0, 200, 30);
			startButtonSprite.graphics.endFill();
			startButton.overState = startButton.downState = startButton.upState = startButton.hitTestState = startButtonSprite;
			
			//aspect textBox
			textBox.type = TextFieldType.INPUT;
			textBox.background = true;
			//textBox.addEventListener(TextEvent.TEXT_INPUT, textInputCapture);
			
			addChild(startButton);
			addChild(textBox);
		}
	
	}

}