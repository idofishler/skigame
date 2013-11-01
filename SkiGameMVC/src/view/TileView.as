package view
{
	import common.AssetWarehouse;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import model.MainModel;
	import model.TileModel;
	
	public class TileView extends Sprite
	{
		private var leftRock_mc:MovieClip;
		private var middleRock_mc:MovieClip;
		private var rightRock_mc:MovieClip;
		private var rocksViews:Array;
		private var tileModel:TileModel;
		
		//will hold all the views for "rock" versions: rock and 4 kinds of trees
		public function TileView(tileModel:TileModel)
		{
			this.tileModel = tileModel;
			this.leftRock_mc = AssetWarehouse.getInstance().getSkinAsset("rock") as MovieClip;
			this.middleRock_mc = AssetWarehouse.getInstance().getSkinAsset("rock") as MovieClip;
			this.rightRock_mc = AssetWarehouse.getInstance().getSkinAsset("rock") as MovieClip;
			// select if it's a rock of tree
			this.leftRock_mc.gotoAndStop(selectRockSkin());
			this.middleRock_mc.gotoAndStop(selectRockSkin());
			this.rightRock_mc.gotoAndStop(selectRockSkin());
			// set the rocks positions
			this.leftRock_mc.x = tileModel.pos.x;
			this.middleRock_mc.x = tileModel.midRockPos;
			this.rightRock_mc.x = tileModel.rightRockPos;
			addChild(leftRock_mc);
			addChild(middleRock_mc);
			addChild(rightRock_mc);
			this.visible = false;
		}
		
		//updates size and location for all 3 view objects
		public function update():void
		{
			leftRock_mc.width += TileModel.WIDTH_FACTOR;
			leftRock_mc.height += TileModel.HEIGHT_FACTOR;
			middleRock_mc.width += TileModel.WIDTH_FACTOR;
			middleRock_mc.height += TileModel.HEIGHT_FACTOR;
			rightRock_mc.width += TileModel.WIDTH_FACTOR;
			rightRock_mc.height += TileModel.HEIGHT_FACTOR;
			leftRock_mc.x -=8;
			middleRock_mc.x -=3;
			rightRock_mc.x +=3;
		}
		
		//checks collision of at least one of the objects with skiman
		public function checkCollision(skiMan:DisplayObject):Boolean
		{
			return (leftRock_mc.hitTestPoint(skiMan.x, skiMan.y) ||
				middleRock_mc.hitTestPoint(skiMan.x, skiMan.y) ||
				rightRock_mc.hitTestPoint(skiMan.x, skiMan.y))
		}
		
		//selects a random kind of view object
		private function selectRockSkin():uint
		{
			return randRange(1,5);
		}
		
		//returns a random number according to the number of view objects
		private function randRange(minNum:Number, maxNum:Number):uint
		{
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}
	
		
	}
}