package model.VO
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	 * incarca data despre
	 */
	public class DataVO
	{
		public var boardSize:int;
		public var planeType:Array;
		
		public function loadXML():void
		{
			var sizesXML:XML = new XML();
			var XML_URL:String = "assets/sizes.xml";
			var myXMLURL:URLRequest = new URLRequest(XML_URL);
			var myLoader:URLLoader = new URLLoader(myXMLURL);
			myLoader.addEventListener(Event.COMPLETE, xmlLoaded);
			
			
			function xmlLoaded(event:Event):void
			{
				sizesXML = XML(myLoader.data);
				boardSize = sizesXML.BOARD_SIZE.@value;
				//TODO: incarca data despre avioane
				trace("Data loaded. Board size = "+boardSize);
			}
					
		}
		
		public function DataVO()
		{
		
		}
	
	}

}