package common
{
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;
	
	public class GameKeyboardController extends EventDispatcher
	{
		private var keyPressCash:Object;
		
		public function GameKeyboardController():void {
			keyPressCash = new Object();
		}
		
		public function keyDownHandler(e:KeyboardEvent):void {
			//trace("down e.keyCode=" + e.keyCode);
			keyPressCash[e.keyCode] = true;
			dispatchEvent(e);
		}
		
		public function keyUpHandler(e:KeyboardEvent):void {
			//trace("up e.keyCode=" + e.keyCode);
			keyPressCash[e.keyCode] = false;
			dispatchEvent(e);
		}
		
		public function isKeyDown(keyCode:uint):Boolean {
			return keyPressCash[keyCode] == true;
		}
	}
}