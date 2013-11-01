package model
{
	import flash.net.SharedObject;
	
	public class ScoreModel
	{
		public var score:int;
		public var isNewHighScore:Boolean;
		private var highestScoreObject:SharedObject =  SharedObject.getLocal("skiman_highest_score");
		public var SCORE_FACTOR:uint = 1;
		
		public function ScoreModel()
		{
			init();
			if (highestScoreObject.data.highScore == null) 
				highestScoreObject.data.highScore = 0;
		}
		
		//initializes score model
		public function init():void
		{
			isNewHighScore = false;
			this.score = -1;
			this.SCORE_FACTOR = 1;
			
		}
		
		//updates score
		public function update():void
		{
			this.score += SCORE_FACTOR;
		}
		
		//increase score in case of up arrow
		public function increasScore():void{
			SCORE_FACTOR++;
		}
		
		public function decreaseScore():void{
			SCORE_FACTOR--;
		}
		
		public function get highestScore():int
		{
			return highestScoreObject.data.highScore;			
		}
		
		public function set highestScore(newScore:int):void 
		{
			highestScoreObject.data.highScore = newScore;
			isNewHighScore = true;
		}
	}
}