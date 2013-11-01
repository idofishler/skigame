package view
{
	import common.AssetWarehouse;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import model.MainModel;
	
	public class MainView extends Sprite
	{
		public var skiManView:SkiManView;
		public var levelView:LevelView;
		public var mainModel:MainModel;
		public var background:Sprite;
		public var menuView:MenuView;
		public var scoreView:ScoreView;
		
		public function MainView(mainModel:MainModel)
		{
			this.mainModel = mainModel;
			
			//ADD BACKGROUND
			this.addChild(AssetWarehouse.getInstance().getSkinAsset("background") as MovieClip);
			
			//ADD MENU
			this.menuView = new MenuView(this.mainModel.scoreModel);
			this.addChild(menuView);
			
			//initialize views
			init();
		}
		
		public function init():void
		{
			if (levelView != null)
				removeChild(levelView);
			
			if (skiManView != null)
				removeChild(skiManView);
			
			if (scoreView != null)
				removeChild(scoreView);
			
			this.menuView.hide(); 
			
			// ADD LEVEL
			this.levelView = new LevelView(this.mainModel.levelModel);
			this.addChild(levelView);
			
			//ADD SCORE
			this.scoreView = new ScoreView(this.mainModel.scoreModel);
			this.addChild(scoreView);

			//ADD SKI MAN
			this.skiManView = new SkiManView(this.mainModel.skiManModel);
			this.addChild(skiManView);
			
			this.swapChildren(this.levelView, this.menuView);
		}
		
		//updates the views as long as the game is running
		public function update():void 
		{
			var isGameRunning:Boolean = !mainModel.isGameOver();
			
			if (isGameRunning)
			{
				this.skiManView.update();
				this.levelView.update();
				this.scoreView.update();
			} 
			else
			{
				menuView.show();
			}
		}
		
		//checks collision of ski man
		public function checkCollision():Boolean
		{
			return levelView.checkRockCollision(this.skiManView);
		}
	}
}