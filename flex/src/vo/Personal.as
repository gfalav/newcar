package vo
{
	public class Personal
	{
		[Bindable] public var id:Number;
		[Bindable] public var apellido:String;
		[Bindable] public var nombre:String;
		[Bindable] public var documento:String;
		[Bindable] public var telefono:String;
		[Bindable] public var direccion:String;
		[Bindable] public var contratista_id:Number;
		[Bindable] public var contratista:String;
		
		public function Personal(id:Number,
								 apellido:String,
								 nombre:String,
								 documento:String,
								 telefono:String,
								 direccion:String,
								 contratista_id:Number,
								 contratista:String)
		{
			this.id = id;
			this.apellido = apellido;
			this.nombre = nombre;
			this.documento = documento;
			this.telefono = telefono;
			this.direccion = direccion;
			this.contratista_id = contratista_id;
			this.contratista = contratista;
		}

	}
}