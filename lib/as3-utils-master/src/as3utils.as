package
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import utils.draw.createRectangleShape;
	
	public class as3utils extends Sprite
	{
		public function as3utils()
		{
			this.addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init(e:Event):void{
			this.removeEventListener(Event.ADDED_TO_STAGE,init);
			var __loader:Loader=new Loader();
			__loader.load(new URLRequest("Movie.swf"));
			__loader.contentLoaderInfo.addEventListener(Event.INIT,onMovieLoaded);
			
			this.addChild(createImage(100,100,2));
		}
		
		private function onMovieLoaded(e:Event):void
		{
			this.addChild(Loader(e.target.loader).content);
		}
		
		private function createImage(__w:Number,__h:Number,__i:uint):Sprite{
			var sp:Sprite=new Sprite();
			sp.addChild(createRectangleShape(__w,__h));
			
			var txt:TextField = new TextField();
			txt.text=String(__i);
			txt.textColor=0xFFFFFF;
			txt.setTextFormat(new TextFormat("arial",30,0xFFFFFF));
			txt.x=sp.width/2-txt.textWidth/2;
			txt.y=sp.height/2-txt.textHeight/2;
			sp.addChild(txt);
			
			return sp;
		}
		
	}
}