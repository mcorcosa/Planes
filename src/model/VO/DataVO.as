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
		public var planeSize:Array;
		public var planeShape:Array;
		
		public function loadXML():void
		{
			this.planeShape = new Array(4);
			this.planeSize = new Array(4);
			var sizesXML:XML = new XML();
			var XML_URL:String = "assets/sizes.xml";
			var myXMLURL:URLRequest = new URLRequest(XML_URL);
			var myLoader:URLLoader = new URLLoader(myXMLURL);
			myLoader.addEventListener(Event.COMPLETE, xmlLoaded);

			
			function xmlLoaded(event:Event):void
			{
				sizesXML = XML(myLoader.data);
				boardSize = sizesXML.BOARD_SIZE.@value;
				trace(" Data loaded. Board size = " + boardSize);
				
				for (var j:int = 0; j < Globals.NUMBER_OF_PLANES; j++) {
					planeSize[j] = sizesXML.SHAPE[j].@size;
					planeShape[j] = sizesXML.SHAPE[j].@value;
				}
					
				/*trace("Loaded data for planes:");
				for (var i:int = 0; i < Globals.NUMBER_OF_PLANES; i++) {
					trace (planeSize[i]+" "+planeShape[i]);
				}*/
			}
					
		}
		
		public function getBoardSize():int {
			return boardSize;
		}
		
		
		
		public function DataVO()
		{
			
		}
	
	}

}