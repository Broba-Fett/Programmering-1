package 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Angelica
	 */
	public class Tiles extends Sprite
	{
		
		[Embed(source = '../lib/water.png')]
		private var WaterImage:Class;
		[Embed(source = '../lib/hit.png')]
		private var HitImage:Class;
		[Embed(source = '../lib/miss.png')]
		private var MissImage:Class;
		
		private const WATER:int = 0;
		private const HIT:int = 1;
		private const MISS:int = 2;
		
		private var tileType:int = WATER;		
		public var isShip:Boolean = false;
		
		private var tileX:int;
		private var tileY:int;
		
		public function Tiles(i:int, j:int) 
		{
			
			this.graphics.beginBitmapFill(Bitmap(new WaterImage).bitmapData);
			this.graphics.drawRect(0, 0, 48, 48);
			this.graphics.endFill();
			this.tileX = 48 + j * (this.width + 5);
			this.tileY = 48 + i * (this.height + 5);
			
			this.x = this.tileX;
			this.y = this.tileY;
		}
		
		public function checkTile():void {
			if (this.isShip) {
				this.tileType = this.HIT;
				
				
			} else {
				this.tileType = this.MISS;
				
			}
			
			updateTile();
		}
		
		public function resetTile():void {
			this.isShip = false;
			this.tileType = this.WATER;
			updateTile();
		}
		
		public function updateTile():void {
			if (this.tileType == this.WATER) 
			{
				changeTile(WaterImage);
			} 
			else if (this.tileType == this.HIT)
			{
				changeTile(HitImage);
			}
			else if (this.tileType == this.MISS)
			{
				changeTile(MissImage);
			}
		}
		
		public function changeTile(type:Class):void {
			this.graphics.clear();
			this.graphics.beginBitmapFill(Bitmap(new type).bitmapData);
			this.graphics.drawRect(0, 0, 48, 48);
			this.graphics.endFill();
			this.x = this.tileX;
			this.y = this.tileY;
			
		}
		
	}

}
