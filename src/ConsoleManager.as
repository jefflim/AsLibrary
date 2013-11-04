package {
	import com.junkbyte.console.Cc;
	import com.junkbyte.console.ConsoleChannel;

	import flash.display.DisplayObject;
	import flash.utils.Dictionary;

	public class ConsoleManager {
		public static const NAME:String = "ConsoleManager";
		public static const TRACE:String = NAME + "Trace";

		private static var _instance:ConsoleManager;
		private static var _allowInstance:Boolean = false;
		private var _dictChannel:Dictionary;

		public function ConsoleManager() {
			if (!_allowInstance)
				throw new Error("Singleton Class!");
		}

		public static function get instance():ConsoleManager {
			if (!_instance) {
				_allowInstance = true;
				_instance = new ConsoleManager();
				_allowInstance = false;
			}
			return _instance;
		}

		public function init($target:DisplayObject):void {
			Cc.config.commandLineAllowed = true;
			Cc.config.maxLines = 2000;
			Cc.startOnStage($target, "`");
			Cc.commandLine = true;
		}

		public function log($name:*, ... args):void {
			if (!dictChannel[$name]) {
				addChannel($name);
			}
			dictChannel[$name].log(args);
			trace("[" + $name + "]", args);
		}

		private function addChannel(c:String):void {
			dictChannel[c] = new ConsoleChannel(c);
			//dictChannel[c].info(c);
		}

		public function get dictChannel():Dictionary {
			if (!_dictChannel)
				_dictChannel = new Dictionary();
			return _dictChannel;
		}

		public function set dictChannel(value:Dictionary):void {
			_dictChannel = value;
		}

	}
}
