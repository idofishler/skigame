package
{
	import flash.display.Sprite;	
	import flash.events.Event;
	
	import controller.MainController;
	import common.AssetWarehouse;
	import model.MainModel;
	
	
	[SWF(width="550", height="400", frameRate="24", backgroundColor="#333333")]
	public class SkiGameMVC extends Sprite
	{
		
		private var mainController:MainController;
		
		public function SkiGameMVC()
		{
			AssetWarehouse.getInstance().addEventListener(Event.INIT, init);
		}
		
		private function init(event:Event):void 
		{ 
			var mainModel:MainModel = new MainModel();
			this.mainController = new MainController(this.stage, mainModel); 	
		}
	}
}