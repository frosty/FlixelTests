package  
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author James Frost
	 */
	public class Player extends FlxSprite 
	{
		public function Player(x : int, y : int, size : int, color : int) 
		{
			super(x, y);
			trace("MAKING PLAYER AT " + x + ", " + y);
			this.makeGraphic(size, size, color);
		}
		
	}

}