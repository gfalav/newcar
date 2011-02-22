package vo
{
	public class Cuenta
	{
		[Bindable] public var id:Number;
		[Bindable] public var nombre:String;
		[Bindable] public var ancestry:String;
		
		
		public function Cuenta(id:Number,nombre:String,ancestry:String)
		{
			this.id = id;
			this.nombre = nombre;
			this.ancestry = ancestry;
		}

	}
}