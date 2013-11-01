package view
{
	import common.AssetWarehouse;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import model.SkiManModel;
	
	public class SkiManView extends Sprite
	{
		private var skiManModel:SkiManModel;
		private var skiMan_mc:MovieClip;
		
		public function SkiManView(skiManModel:SkiManModel)
		{
			this.skiManModel = skiManModel;
			skiMan_mc = AssetWarehouse.getInstance().getSkinAsset("ski_man") as MovieClip;
			skiMan_mc.gotoAndStop(skiManModel.twist);
			skiMan_mc.scaleX = 0.8;
			skiMan_mc.scaleY = 0.8;
			this.addChild(skiMan_mc);
		}
		
		public function update():void
		{
			if (skiManModel.isDead()) {
				removeChildAt(0);
			} else 	{
				this.x = skiManModel.pos.x;
				this.y = skiManModel.pos.y;
				this.skiMan_mc.gotoAndStop(skiManModel.getTwist());
			}
		}
	}
}