package {
	import com.junkbyte.console.Cc;
	import com.junkbyte.console.ConsoleChannel;
	
	import flash.display.DisplayObject;
	import flash.utils.Dictionary;

	public class ConsoleClass {
		public static const NAME:String = "ConsoleManager";
		public static const TRACE:String = NAME + "Trace";
		private var _dictChannel:Dictionary;
		
		public function ConsoleClass($target:DisplayObject) {
			Cc.config.commandLineAllowed = true;
			Cc.config.maxLines = 2000;
			Cc.startOnStage($target, "`");
			Cc.commandLine = true;
		}
		
		public function log($name:String, ...args):void{
			if(!dictChannel[$name]){
				addChannel($name);
			}
			dictChannel[$name].log(args);
		}
		
		private function addChannel(c:String):void {
			dictChannel[c] = new ConsoleChannel(c);
			//dictChannel[c].info(c);
		}
		
		public function get dictChannel():Dictionary {
			if(!_dictChannel)
				_dictChannel = new Dictionary();
			return _dictChannel;
		}
		
		public function set dictChannel(value:Dictionary):void {
			_dictChannel = value;
		}

		
	}
}
