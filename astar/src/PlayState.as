package
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		private var maze:FlxTilemap;
		private const CELL_SIZE : Number = 8;
		private const ROWS : Number = 15;
		private const COLS : Number = 20;
		
		override public function create():void
		{
			FlxG.bgColor = 0xffaaaaaa;
			
			this.generateMaze();
		}
		
		override public function update():void
		{
			super.update();
			if (FlxG.keys.justPressed("SPACE"))
				this.generateMaze();
		}
				
		private function generateMaze() : void
		{
			var data:Array = new Array(300);
			
			// ceiling
			
			// floor
			
			// walls
			
			for (var i : int = 0; i < ROWS; i++)
			{
				for (var j : int = 0; j < COLS; j++)
				{
					if (i == 0 || i == 14)
						data[(i*COLS)+j] = 1;
					else if (j == 0 || j == 19)
						data[(i*COLS)+j] = 1;
					else
						data[(i*COLS)+j] = Util.randomNumber(0,1);
				}			
			}
			
			for (var i : int = COLS; i < 300-COLS; i++)
			{
				if (data[i] == 1)
				{
					if ((data[i-1] == 0) && (data[i+1] == 0) &&
						(data[i-COLS] == 0) && (data[i+COLS] == 0))
					{
						data[i] = 0;
					}
				}
			}
			
			if (maze)
				remove(maze);
				
			maze = new FlxTilemap();
			maze.loadMap(FlxTilemap.arrayToCSV(data, 20), FlxTilemap.ImgAuto, 0, 0, FlxTilemap.AUTO);
			add(maze);
		}
	}
}