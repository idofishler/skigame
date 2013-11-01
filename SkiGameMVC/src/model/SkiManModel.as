package model
{
	import flash.geom.Point;
	
	public class SkiManModel
	{
		public var pos:Point;
		private var dead:Boolean;
		private var slideSpeed:Number;
		private static const MOVEMENT_SPEED:uint = 1;
		private static const ROTATION_FACTOR:Number = 180;
		private static const INIT_SLIDE:Number = 2;
		private static const NUM_OF_FRAMES:uint = 12;
		public var twist:int;
		
		public function SkiManModel()
		{
			init();
		}
		
		public function init():void
		{
			this.pos = new Point(50, MainModel.STAGE_HEIGHT - 50);
			this.dead = false;
			this.slideSpeed = INIT_SLIDE;
			this.twist = getTwist();
//			this.rotation = 0;
		}
		
		public function getTwist():int
		{
			var x:uint = this.pos.x;
			return (x / (MainModel.STAGE_WIDTH/NUM_OF_FRAMES)) + 1;
		}
		
		//left movement
		public function moveLeft():void
		{
			slideSpeed -= MOVEMENT_SPEED;
			if (slideSpeed == 0)
				slideSpeed -= MOVEMENT_SPEED;
		}
		
		//right movement
		public function moveRight():void
		{
			slideSpeed += MOVEMENT_SPEED;
			if (slideSpeed == 0)
				slideSpeed += MOVEMENT_SPEED;
		}
		
		//update ski man position according to speed
		public function slide():void
		{
			pos.x += slideSpeed;
		}
		
		public function die():void
		{
			dead = true;
		}
		
		public function isDead():Boolean
		{
			return dead;
		}
		
		//checks if ski man is out of stage, if so, teminate game
		private function checkPosition():void
		{
			if (pos.x > MainModel.STAGE_WIDTH || pos.x < 0)
				this.die();
		}
		
		//updates ski man slide and check current position
		public function update():void
		{
			slide();
			checkPosition();	
		}
	}
}