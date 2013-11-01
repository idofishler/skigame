package view
{
	import common.AssetWarehouse;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import model.MainModel;
	import model.ScoreModel;
	
	public class MenuView extends Sprite
	{
		public static const START_CLICK_EVENT:String = "START_CLICK_EVENT";
		private var scoreModel:ScoreModel;
		private var menu_mc:MovieClip;
		
		public function MenuView(scoreModel:ScoreModel)
		{
			this.scoreModel = scoreModel;
			this.menu_mc = AssetWarehouse.getInstance().getSkinAsset("menu",false) as MovieClip;
			this.menu_mc.x = MainModel.STAGE_WIDTH/2;
			this.menu_mc.y = MainModel.STAGE_HEIGHT/2;
			this.addChild(this.menu_mc);
			this.menu_mc.menu_item.button.addEventListener(MouseEvent.CLICK, startGameClicked);
		}
		
		//activate start event
		public function startGameClicked(e:Event):void
		{
			this.dispatchEvent(new Event(START_CLICK_EVENT));
		}
		
		public function hide():void
		{
			this.menu_mc.visible = false;
		}
		
		public function show():void
		{
			// If the menu is already on - do nothing!
			if (menu_mc.visible)
			{
				return;
			}
			
			this.menu_mc.visible = true;
			this.menu_mc.gotoAndPlay(0);
			
			if (scoreModel.score == -1)
			{
				this.menu_mc.menu_item.score.current_score_werapper.visible = false;
			} 
			else 
			{
				this.menu_mc.menu_item.score.current_score_werapper.visible = true;
				this.menu_mc.menu_item.score.current_score_werapper.current_score.text = scoreModel.score;
			}
			
			this.menu_mc.menu_item.score.highest_score_werapper.highest_score.text = scoreModel.highestScore;
			this.menu_mc.menu_item.new_high_score.visible = scoreModel.isNewHighScore;
		}
	}
}