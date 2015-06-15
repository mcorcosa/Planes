package model.VO
{
	
	/**
	 * VO care pastreaza dimensiunea si forma avionului
	 *
	 * @author gh
	 */
	public class PlaneVO
	{
		public var size:int;
		public var shape:int;
		public var map:Array = new Array(size);
		
		public function PlaneVO(size:int, shape:int)
		{
			this.size = size;
			this.shape = shape;
			
			for (var i:int = size - 1; i >= 0; i--)
			{
				this.map[i] = new Array(size);
				for (var j:int = size - 1; j >= 0; j--)
				{
						if (shape % 2 == 1)
							this.map[i][j] = 1;
						else
							this.map[i][j] = 0;
						shape = shape / 2;
				}
			}
		}
		
		public function rotate(degrees:int):void {
			var reverse:Array = new Array(size);
			
			for (var i:int = size - 1; i >= 0; i--){
				reverse[i] = new Array(size); 
			}
			
			switch (degrees) 
			{
				case 90:  
					for (var j:int = 0; j < size; ++j) {
						for (var k:int = 0; k < size; ++k) {
							reverse[j][k] = map[this.size - k - 1] [j];
						}
					}
					
					for (j = 0; j < size; ++j) {
						for (k = 0; k < size; ++k) {
						this.map[j][k] = reverse[j][k];
						}
					}

				break;
				
				case 180:  {
					rotate(90);
					rotate(90);
				}
				break;
				
				case 270:  {
					rotate(90);
					rotate(90);
					rotate(90);
				}
				break;
				
				default:
			}
			
		}
	}

}