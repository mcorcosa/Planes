package view.views
{
	import events.StartGameEvent;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.text.*;
	
	/**
	 * Afiseaza un IntroScreen - background + textbox pentru player name + buton de start
	 * executa comanda StartGame
	 * * TODO: adauga background si text pe startButton
	 * @author gh
	 */
	public class IntroScreen extends Sprite
	{
		public static const NAME:String = "IntroScreen";
		public static const DISPLAY:String = NAME + "Show"
		public static const STARTSETUP:String = "Start Setup";
		
		public var textBox:TextField;
		public var startButton:SimpleButton;
		public var textField:TextField;
		
		public function display():void
		{
			var startText:TextField = new TextField;
			
			textBox = new TextField;
			startButton = new SimpleButton;
			textField = new TextField;
			
			textField.width = 200; 
			textField.x = 300;
			textField.y = 140;
			textField.defaultTextFormat = Globals.smallFormat;
			textField.text = "Please enter a player name";
			addChild(textField);
			
			//aspect startButton 
			var startButtonSprite:Sprite = new Sprite();
			startButtonSprite.graphics.lineStyle(1, 0xCCCCFF);
			startButtonSprite.graphics.beginFill(0x000040, 1);
			startButtonSprite.graphics.drawRoundRect(300, 280, 200, 30, 10, 10);
			startButtonSprite.graphics.endFill();
			startButton.overState = startButton.downState = startButton.upState = startButton.hitTestState = startButtonSprite;
			startButton.addEventListener(MouseEvent.CLICK, startButtonClick);
			startText.text = "START";
			startText.defaultTextFormat = Globals.label;
			startButtonSprite.addChild(startText);
			
			
			//aspect textBox
			textBox.type = TextFieldType.INPUT;
			textBox.background = true;
			textBox.backgroundColor = uint("0x" + Globals.lightBlue.substr(1));
			textBox.width = 200; 
            textBox.height = 30;  
			textBox.borderColor = 0x000040;
            textBox.border = true; 
			textBox.x = 300;
			textBox.y = 200;
			textBox.defaultTextFormat = Globals.format;
			
			addChild(startButton);
			addChild(textBox);
		
		}
		
		
		public function startButtonClick(e:MouseEvent):void
		{
			if (!textBox.text) {
				trace ("Enter a player name");
				textField.textColor = 0xFF0000;
			}
				else
					dispatchEvent(new StartGameEvent(STARTSETUP, textBox.text));
		}
	
	}

}