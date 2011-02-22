package vo
{
	public class Vehiculo
	{
		[Bindable] public var id:Number;
		[Bindable] public var patente:String;
		[Bindable] public var marca:String;
		[Bindable] public var modelo:String;
		[Bindable] public var afabric:Number;
		[Bindable] public var tvehiculo_id:Number;
		[Bindable] public var tvehiculo:String;
		
		public function Vehiculo(id:Number,patente:String,marca:String,modelo:String,afabric:Number,tvehiculo_id:Number,tvehiculo:String)
		{
			this.id = id;
			this.patente = patente;
			this.marca = marca;
			this.modelo = modelo;
			this.afabric = afabric;
			this.tvehiculo_id = tvehiculo_id;
			this.tvehiculo = tvehiculo;
		}

	}
}