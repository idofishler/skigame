package controller
{
	import common.AssetWarehouse;
	import common.GameKeyboardController;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	
	import model.MainModel;
	
	import view.MainView;
	import view.MenuView;
	
	public class MainController
	{
		private var stage:Stage;
		private var timer:Timer;
		private var gameKeyController:GameKeyboardController;
		
		private var mainModel:MainModel;
		private var mainView:MainView;
		
		public function MainController(stage:Stage, mainModel:MainModel)
		{
			this.stage = stage
			this.mainModel = mainModel;
			
			//start view & add to stage.
			this.mainView = new MainView(mainModel);
			this.stage.addChild(mainView);
			
			// start keyboard listening
			this.gameKeyController = new GameKeyboardController();
			this.stage.addEventListener(KeyboardEvent.KEY_DOWN, gameKeyController.keyDownHandler);
			this.stage.addEventListener(KeyboardEvent.KEY_UP, gameKeyController.keyUpHandler);

			//Start Timer
			timer = new Timer(42);
			timer.addEventListener(TimerEvent.TIMER, timerHandler);
			timer.start();
			
			//Show the menu
			mainView.menuView.show();
			
			this.mainView.menuView.addEventListener(MenuView.START_CLICK_EVENT, startGame);
		}
		
		private function startGame(e:Event):void 
		{					
			mainModel.init();
			mainView.init();
		}
		
		private function timerHandler(event:TimerEvent):void
		{	
			if (!mainModel.isGameOver())
			{
				// Check if we have a collision
				if (this.mainView.checkCollision()) 
				{
					this.mainModel.skiManModel.die();
					this.mainModel.updateHighScore();	
				} 
				else
				{	
					if (gameKeyController.isKeyDown(Keyboard.LEFT))
						mainModel.skiManModel.moveLeft();
					if (gameKeyController.isKeyDown(Keyboard.RIGHT)) 
						mainModel.skiManModel.moveRight();
//					// This uses for debug --- or possible enhancment
//					if (gameKeyController.isKeyDown(Keyboard.UP))
//					{
//						mainModel.levelModel.speedCam();
//						mainModel.scoreModel.increasScore();
//					}
//					if (gameKeyController.isKeyDown(Keyboard.DOWN))
//					{
//						mainModel.levelModel.slowCam();
//						mainModel.scoreModel.decreaseScore();
//					}
						
				}
				//UPDATE THE MODEL
				this.mainModel.update();				
			}
			// tell the view to update after the model has changed
			this.mainView.update();
		}
	}
}