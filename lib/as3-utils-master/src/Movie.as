package
{
	import flash.display.Sprite;
	
	import utils.draw.createRectangleShape;
	
	public class Movie extends Sprite
	{
		public function Movie()
		{
			super();
			var __sp:Sprite=new Sprite();
			__sp.addChild(createRectangleShape(100,100,0xff0000,1,200,200));
			this.addChild(__sp);
		}
	}
}