package vo
{
	public class Tvehiculo
	{
		[Bindable] public var id:Number;
		[Bindable] public var tipo:String;
		
		public function Tvehiculo(id:Number,tipo:String)
		{
			this.id = id;
			this.tipo = tipo;
		}

	}
}