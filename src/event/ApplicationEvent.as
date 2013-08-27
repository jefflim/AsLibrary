package event {
	import flash.events.Event;

	public class ApplicationEvent extends Event {
		private var _params:Object;

		public function ApplicationEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
		}

		public function get params():Object {
			return _params;
		}

		public function set params(value:Object):void {
			_params = value;
		}

	}
}
