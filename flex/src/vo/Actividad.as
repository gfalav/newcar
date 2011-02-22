package vo
{
	public class Actividad
	{
		[Bindable] public var id:Number;
		[Bindable] public var cuenta_id:Number;
		[Bindable] public var nombre:String;
		[Bindable] public var descripcion:String;
		[Bindable] public var factividad:Date;
		[Bindable] public var hscar:Number;
		
		public function Actividad(id:Number,cuenta_id:Number,nombre:String,descripcion:String,factividad:Date,hscar:Number)
		{
			this.id = id;
			this.cuenta_id = cuenta_id;
			this.nombre = nombre;
			this.descripcion = descripcion;
			this.factividad = factividad;
			this.hscar = hscar;
		}

	}
}