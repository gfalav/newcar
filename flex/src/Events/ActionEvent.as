package Events
{
	import flash.events.Event;

	public class ActionEvent extends Event
	{
		public var accion:String;
		
		public function ActionEvent(accion:String, type:String='ActionEvent', bubbles:Boolean=true, cancelable:Boolean=true)
		{
			this.accion = accion;
			super(type, bubbles, cancelable);
		}

        override public function clone():Event {
            return new ActionEvent(accion,type);
        }		
	}
}