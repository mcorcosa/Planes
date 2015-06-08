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
<<<<<<< HEAD
		public static const START:String = NAME + "Start";
=======
		public static const START:String = "STARTGAME";
>>>>>>> parent of e7156ae... Finished Intro Screen and loading from external XML file
		
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
<<<<<<< HEAD
			startButtonSprite.graphics.drawRect(0, 0, 200, 30);
			startButtonSprite.graphics.endFill();
			startButton.overState = startButton.downState = startButton.upState = startButton.hitTestState = startButtonSprite;
=======
			startButtonSprite.graphics.drawRoundRect(300, 280, 200, 30, 10, 10);
			startButtonSprite.graphics.endFill();
			startButton.overState = startButton.downState = startButton.upState = startButton.hitTestState = startButtonSprite;
			startButton.addEventListener(MouseEvent.CLICK, startButtonClick);
>>>>>>> parent of e7156ae... Finished Intro Screen and loading from external XML file
			
			//aspect textBox
			textBox.type = TextFieldType.INPUT;
			textBox.background = true;
<<<<<<< HEAD
			//textBox.addEventListener(TextEvent.TEXT_INPUT, textInputCapture);
			
			addChild(startButton);
			addChild(textBox);
=======
			textBox.backgroundColor = uint("0x" + Globals.lightBlue.substr(1));
			textBox.width = 200; 
            textBox.height = 30;  
            textBox.border = true; 
			textBox.x = 300;
			textBox.y = 200;
			
			addChild(startButton);
			addChild(textBox);
		
		}
		
		public function startButtonClick(e:MouseEvent):void
		{
			dispatchEvent(new StartGameEvent(START, textBox.text));
>>>>>>> parent of e7156ae... Finished Intro Screen and loading from external XML file
		}
	
	}

}