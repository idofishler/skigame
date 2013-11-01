package model
{
	import flash.geom.Point;
	
	public class TileModel
	{
		public var pos:Point;
		public static var TILE_WIDTH:Number = 230;
		public static var TILE_HEIGHT:Number = 20;
		public static var HEIGHT_FACTOR:Number = 0.3;
		public static var WIDTH_FACTOR:Number = 0.8;
		public static var ON_WHITE_POS:Number = 2.6;
		public var width:Number;
		public var height:Number;
		public var outOfStage:Boolean;
		public var visible:Boolean;
		public var midRockPos:uint;
		public var rightRockPos:uint;
		public static const GRID_SIZE:uint = 30;
		
		public function TileModel(leftRock:Point, midRockPos:uint, rightRockPos:uint)
		{
			this.pos = new Point();
			this.pos.x = leftRock.x * GRID_SIZE;
			this.midRockPos = midRockPos * GRID_SIZE;
			this.rightRockPos = rightRockPos * GRID_SIZE;
			this.pos.y = -leftRock.y * GRID_SIZE;
			this.width = TILE_WIDTH;
			this.height = TILE_HEIGHT;
			this.visible = false; 
			this.outOfStage = false;
		}
		
		//checks if ski man is out of stage
		public function isOutOfStage():Boolean
		{
			return (this.pos.y >= MainModel.STAGE_HEIGHT);
		}
		
		//updates tiles height and width according to position on screen
		public function update():void
		{
			this.width += WIDTH_FACTOR;
			this.height += HEIGHT_FACTOR;				
		}
	}
}
