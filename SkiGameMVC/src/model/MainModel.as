package model
{
	import flash.geom.Point;
	
	public class MainModel
	{
		public static const STAGE_WIDTH:uint = 550;
		public static const STAGE_HEIGHT:uint = 400;
		public static const CENTER_FACTOR:uint = 130;
		
		public var skiManModel:SkiManModel;
		public var levelModel:LevelModel;
		private var gameOver:Boolean;
		public var scoreModel:ScoreModel;
		
		public function MainModel()
		{
			this.skiManModel = new SkiManModel();
			this.levelModel = new LevelModel();
			this.scoreModel = new ScoreModel();
			this.gameOver = true;
		}
		
		//initializes game models
		public function init():void
		{	
			this.levelModel.init();
			this.scoreModel.init();
			this.skiManModel.init();
			this.gameOver = false;
		}
		
		//updates models and advances camera
		public function update():void
		{
			if (skiManModel.isDead() || levelModel.isLevelFinished())
			{
				this.setGameOver();
				this.updateHighScore();
				return;
			}
			this.levelModel.advanceCamera();
			this.scoreModel.update();
			this.skiManModel.update();
		}
		
		public function setGameOver():void
		{
			this.gameOver = true;
		}
		
		public function updateHighScore():void
		{
			if (scoreModel.highestScore < scoreModel.score)
			{
				scoreModel.highestScore = scoreModel.score;
			}	
		}
		
		public function isGameOver():Boolean
		{
			return gameOver;
		}
	}
}