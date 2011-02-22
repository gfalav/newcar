package vo
{
	import mx.collections.ArrayCollection;
	
	public class Movil
	{
		[Bindable] public var id:Number;
		[Bindable] public var nombre:String;
		[Bindable] public var ofcar_id:Number;
		[Bindable] public var ofcar:String;
		[Bindable] public var personalsarr:ArrayCollection = new ArrayCollection;
		[Bindable] public var vehiculo:Vehiculo;
		
		public function Movil(id:Number,nombre:String,ofcar_id:Number,ofcar:String)
		{
			this.id = id;
			this.nombre = nombre;
			this.ofcar_id = ofcar_id;
			this.ofcar = ofcar;
		}

	}
}