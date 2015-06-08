<<<<<<< HEAD
package controller 
{
	import org.puremvc.as3.interfaces.ICommand;
=======
package controller
{
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
>>>>>>> parent of e7156ae... Finished Intro Screen and loading from external XML file
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * ...
	 * @author gh
	 */
<<<<<<< HEAD
	public class StartGameCommand extends SimpleCommand implements ICommand 
	{
		
		public function StartGameCommand() 
		{
			
		}
		
=======
	public class StartGameCommand extends SimpleCommand implements ICommand
	{
		
		override public function execute(notification:INotification):void
		{
			var PlayerName:String = notification.getBody() as String;
			trace(PlayerName);
		}
	
>>>>>>> parent of e7156ae... Finished Intro Screen and loading from external XML file
	}

}