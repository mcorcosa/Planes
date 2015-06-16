package events 
{
	import flash.display.InteractiveObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author ...
	 */
	public class ClickGridEvent extends MouseEvent 
	{
		public static const CLICKGRIDEVENT:String = " Click grid Event";

		public var x:int;
		public var y:int;

		public function ClickGridEvent(type:String, x:int, y:int, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.x = x;
			this.y = y;
		}

		// always create a clone() method for events in case you want to redispatch them.
		public override function clone():Event
		{
			return new ClickGridEvent(type, x, y, bubbles, cancelable);
		}
	}

}