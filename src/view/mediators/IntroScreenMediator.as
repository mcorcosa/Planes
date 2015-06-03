package view.mediators 
{
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import view.views.IntroScreen;
	
	/**
	 * ...
	 * @author gh
	 */
	public class IntroScreenMediator extends Mediator implements IMediator 
	{
		public static const NAME:String = "IntroScreenMediator";
		private var IntroScreen:IntroScreen;
		
		public function IntroScreenMediator(mediatorName:String=null, viewComponent:Object=null) 
		{
			super(mediatorName, viewComponent);
		}
		
		override public function onRegister():void
        {
			IntroScreen = new IntroScreen;
			viewComponent.addChild(IntroScreen);
        }
		
	}	

}