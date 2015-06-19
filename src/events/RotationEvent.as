package events 
{
	import flash.display.InteractiveObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author gh
	 */
	public class RotationEvent extends MouseEvent 
	{
		
		public static const ROTATE:String = " ROTATE";
		
		public function RotationEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
		}
		
		public override function clone():Event
		{
        return new RotationEvent(type, bubbles, cancelable);
		}
		
	}

}