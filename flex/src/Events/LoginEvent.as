package Events
{
	import flash.events.Event;

	public class LoginEvent extends Event
	{
		public var autorizado:String;
		
		public function LoginEvent(autorizado:String,type:String="LoginEvent", bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.autorizado = autorizado;
			super(type, bubbles, cancelable);
		}
		
        override public function clone():Event {
            return new LoginEvent(autorizado,type);
        }		
	}
}