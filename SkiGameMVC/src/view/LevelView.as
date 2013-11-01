package view
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	import model.LevelFactory;
	import model.LevelModel;
	import model.MainModel;
	import model.TileModel;

	
	public class LevelView extends Sprite
	{
		private var levelModel:LevelModel;
		private var shownTiles:Array;
		private var lastTileAdded:TileModel;
		private var lastTileView:TileView;
		
		public function LevelView(levelModel:LevelModel)
		{
			//TileView array that holds all the tile views that are shown
			this.shownTiles = new Array();
			this.levelModel = levelModel;
			this.lastTileAdded = null;
			this.lastTileView = null;
		}
		
		public function update():void
		{
			//check if the current tile (form the model) needs to be shown 
			var curTileModel:TileModel = levelModel.getCurrentTile();
			if (lastTileAdded != curTileModel)
			{
				var nextTileToShow:TileView = new TileView(curTileModel);
				nextTileToShow.x = MainModel.STAGE_WIDTH - TileModel.TILE_WIDTH;
				nextTileToShow.y = 240;
				shownTiles.push(nextTileToShow);
				this.addChild(nextTileToShow);
				
				lastTileView = nextTileToShow;		
				lastTileAdded = curTileModel;
			}
			advanceTiles();
			updateShownTiles();
		}
		
		private function advanceTiles():void 
		{
			for (var i:uint = 0; i < shownTiles.length; i++)
			{
				if (shownTiles[i] != null)
				{
					shownTiles[i].y  += levelModel.cameraSpeed;
					//case tile is in the white zone - show it
					if (shownTiles[i].y >= 250)
						(shownTiles[i] as TileView).visible = true;
					
					// Check if tile is out of the stage and remove it
					if (shownTiles[i].y > MainModel.STAGE_HEIGHT + TileModel.TILE_HEIGHT) 
					{
						removeChild(shownTiles[i]);
						shownTiles[i] = null;
					}
				}
			}
		}
		
		//updates tile size according to the position on screen
		private function updateShownTiles():void 
		{
			for (var i:uint = 0; i < shownTiles.length; i++)
			{
				//updates size only for shown tiles
				if (shownTiles[i] != null && shownTiles[i].y >= 250)
				{
					(shownTiles[i] as TileView).update();
				}
			}
		}
		
		//checks if the tile elements collide with the ski man
		public function checkRockCollision(skiMan:DisplayObject):Boolean {
			for (var i:uint = 0; i < shownTiles.length; i++)
			{
				if (shownTiles[i] != null) 
				{
					if ((shownTiles[i] as TileView).checkCollision(skiMan))
						return true;
				}
			}
			return false;
		}
	}
}