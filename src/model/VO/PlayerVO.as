package model.VO 
{
	/**
	 VO care pastreaza dimensiunea si "harta" suprafetei de joc
	 * // TODO: scrie constructor, setter pentru nume
	 * @author gh
	 */
	public class PlayerVO 
	{
		var name:String;
		var numberOfPlanes:int;
		
		public function PlayerVO() 
		{
			super();
		}
		
		public function setName(PlayerName:String):void {
				this.name = PlayerName;
		}
		
		public function getName():String {
				return this.name;
		}
	}

}