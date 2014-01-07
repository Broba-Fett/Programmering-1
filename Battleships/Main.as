package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	
	
	/**
	 * ...
	 * @author Angelica
	 */
	
	public class Main extends Sprite 
	{
		private var map:Vector.<Vector.<Tiles>> = new Vector.<Vector.<Tiles>>
		private var shipsSunkScore:TextField = new TextField;
		private var shipsSunk:int;
		private var firedShots:int;
		private var textDisplayFiredShotsScore:TextField = new TextField;
		private var hit:int;
		private var textDisplayHit:TextField = new TextField;
		private var textDisplayMiss:TextField = new TextField;
		public static var hitValue:int;
		public static var missValue:int;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		private function shotFired(key:MouseEvent):void
		{
			Tiles(key.target).checkTile();
			firedShots++;
			textDisplayFiredShotsScore.text = "Fired Shots: " + firedShots; //Detta visar var dina poäng står efter ett klick på mapen
		}
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			addChild(textDisplayFiredShotsScore);
			createMap();
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, resetMap);
		}
		
		private function resetMap(e:KeyboardEvent):void 
		{	//Jag valde en if-sats eftersom detta kändes bäst
			//Trycka space
			if (e.keyCode == 32)
			{
				//poängen nollställs
				firedShots = 0;
				textDisplayFiredShotsScore.text = "Score: 0"
				//10x10 nya tiles
				for (var i:int = 0; i < 10; i++) 
				{
					for (var j:int = 0; j < 10; j++) 
					{
						map[i][j].resetTile();
					}
				}
				placeShipsOnMap();
			}
			
		}
			//Detta bestämmer koordinaterna på rutorna som visar ett skepp, jag valde detta eftersom det var det enda jag kunde
		private function placeShipsOnMap():void {
			var shipX:int = Math.random() * 10;
			var shipY:int = Math.random() * 10;
			var counter:int = 0;
			var placeShips:Boolean = false;
			// här under spårar jag vilka koordinater en ruta på skeppet befinner sig bara för att hjälpa mig
			trace(shipX);
			trace(shipY);
			
			for (var i:int = 0; i < 10; i++) 
			{
				for (var j:int = 0; j < 10; j++) 
				{
					if (i == shipX && j == shipY) 
					{
						placeShips = true;
					}
					map[i][j].isShip = placeShips;
					if (placeShips) 
					{
						counter++;
					}
					if (counter == 3) {
						placeShips = false;
					}
				}
			}
		}
		
			//Jag valde en vector eftersom detta är enklare än att skriva varje ruta var för sig
		private function createMap():void
		{
			for (var i:int = 0; i < 10; i++) 
			{
				var enRad:Vector.<Tiles> = new Vector.<Tiles>();
				
				for (var j:int = 0; j < 10; j++) 
				{	
					enRad.push(new Tiles(i, j));
					addChild(enRad[j]);
					enRad[j].addEventListener(MouseEvent.CLICK, shotFired);
				}
				map.push(enRad);
			}
			placeShipsOnMap();
		}
	}
}
