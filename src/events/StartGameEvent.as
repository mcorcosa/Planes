package events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author gh
	 */
	public class StartGameEvent extends Event 
	{
		public static const STARTSETUP:String = "Start Setup";
		public var result:String;
		
		public function StartGameEvent(type:String, result:String, bubbles:Boolean=true, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			this.result = result;
		}
		
		public override function clone():Event
		{
        return new StartGameEvent(type, result, bubbles, cancelable);
		}
		
	}

}