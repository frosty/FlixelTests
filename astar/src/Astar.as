package
{
	import org.flixel.*;

	[SWF(width="640", height="480", backgroundColor="#000000")]
	public class Astar extends FlxGame
	{
		public function Astar() : void
		{
			super(160, 120, PlayState, 4);
			forceDebugger = true;
		}
	}
}