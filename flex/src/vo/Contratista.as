package vo
{
	public class Contratista
	{
		[Bindable] public var id:Number;
		[Bindable] public var nombre:String;
		
		public function Contratista(id:Number, nombre:String)
		{
			this.id = id;
			this.nombre = nombre;
		}

	}
}