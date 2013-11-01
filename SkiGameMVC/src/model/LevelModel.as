package model
{
	public class LevelModel
	{
		public var cameraYPos:Number; 	// camera Y position (in screen pixels)
		public var currentTile:uint; 	// represent the index in the LevelFactory arr of the last tile
										//that was “discovered” be the camera.
		public var cameraSpeed:uint
		public static const CAMERA_SPEED:Number = 5;
		
		public function LevelModel()
		{
			init();
		}
		
		public function init():void
		{
			cameraYPos = 0;
			currentTile = 0;
			cameraSpeed = CAMERA_SPEED;
		}
		
		//checks to see if the current tile has in the white zone.
		public function isNextTileVisible():Boolean
		{
//			if (getCurrentTile() != null) //DEBUG: need to think of proper condition
//				return (!isLevelFinished() && getCurrentTile().visible);
//			else
//				return !isLevelFinished();
			return (!isLevelFinished() && (getCurrentTile().pos.y + cameraYPos >= 250));
		}
		
		public function getCurrentTile():TileModel
		{
			return LevelFactory.getInstance().tiles[currentTile];
		}
		
		private function advanceTile():void{
			if (!isLevelFinished())
				currentTile++;
		}
		
		public function isLevelFinished():Boolean {
			return (LevelFactory.getInstance().size()-1 == currentTile &&
				   (cameraYPos >= 400));
		}
		
		public function advanceCamera():void {
			this.cameraYPos += cameraSpeed; // add CAMERA_SPEED pixels to the position of the camera
			if (isNextTileVisible()){
				advanceTile();
			}
		}
		
		public function speedCam():void 
		{
			cameraSpeed++;
		}
		
		public function slowCam():void 
		{
			cameraSpeed--;
		}
		
		public function update():void
		{
			for (var i:uint = 0; i < LevelFactory.getInstance().size(); i++) 
			{
				(LevelFactory.getInstance().tiles[i] as TileModel).update();
			}
		}
	}
}