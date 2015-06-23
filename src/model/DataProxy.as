package model 
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import model.VO.DataVO;
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	/**
	 * Proxy for handling and operating DataVO
	 * @author gh
	 */
	public class DataProxy extends Proxy implements IProxy 
	{
		
		public static const NAME:String = "DataProxy";
		
		public var Data:DataVO;
		
		public function DataProxy()
		{
			super(NAME, new DataVO());
		}
		
		public function loadXML():void
		{
			vo.planeShape = new Array(4);
			vo.planeSize = new Array(4);
			var sizesXML:XML = new XML();
			var XML_URL:String = "assets/sizes.xml";
			var myXMLURL:URLRequest = new URLRequest(XML_URL);
			var myLoader:URLLoader = new URLLoader(myXMLURL);
			myLoader.addEventListener(Event.COMPLETE, xmlLoaded);

			
			function xmlLoaded(event:Event):void
			{
				sizesXML = XML(myLoader.data);
				vo.boardSize = sizesXML.BOARD_SIZE.@value;
				trace(" Data loaded. Board size = " + vo.boardSize);
				
				for (var j:int = 0; j < Globals.NUMBER_OF_PLANES; j++) {
					vo.planeSize[j] = sizesXML.SHAPE[j].@size;
					vo.planeShape[j] = sizesXML.SHAPE[j].@value;
				}
					
				/*trace("Loaded data for planes:");
				for (var i:int = 0; i < Globals.NUMBER_OF_PLANES; i++) {
					trace (planeSize[i]+" "+planeShape[i]);
				}*/
			}
		}
		
		public function get vo():DataVO
        {
            return data as DataVO;
        }
		
		public function getBoardSize():int {
			return vo.boardSize;
		}
		
		public function getPlaneSizes():Array {
			return vo.planeSize;
		}
		
		public function getPlaneShapes():Array {
			return vo.planeShape;
		}
		
	}

}