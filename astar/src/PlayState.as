package
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		private var maze:FlxTilemap;
		private const CELL_SIZE : Number = 8;
		private const ROWS : Number = 15;
		private const COLS : Number = 20;
		
		private var start : FlxSprite;
		private var end : Player;
		
		override public function create():void
		{
			FlxG.bgColor = 0xffaaaaaa;
			
			this.generateMaze();
			this.addPlayers();
		}
		
		override public function update():void
		{
			super.update();
			if (FlxG.keys.justPressed("SPACE"))
			{
				this.generateMaze();
				this.addPlayers();
			}
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
		
		private function addPlayers():void
		{
			// Find the first empty block in the bottom left of the map
			for (var j : int = ROWS - 1; j > 0; j--)
			{
				for (var i : int = 0; i < COLS; i++)
				{
					trace("Tile {" + i + ", " + j + "} = " + maze.getTile(i, j));
					if (maze.getTile(i, j) == 0)
					{
						//start = new Player(i * COLS, j * ROWS, CELL_SIZE, 0x00ff00);
						//add(start);
						if (!start)
						{
							start = new FlxSprite(i * CELL_SIZE, j * CELL_SIZE);
							start.makeGraphic(CELL_SIZE, CELL_SIZE, 0xff00ff00);
							add(start);
						}
						else
						{
							start.x = i * CELL_SIZE;
							start.y = j * CELL_SIZE;
						}
						return;
					}
					//FlxG.collide(
				}
			}
		}
	}
}