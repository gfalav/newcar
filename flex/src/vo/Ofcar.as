package vo
{
	public class Ofcar
	{
		[Bindable] public var id:Number;
		[Bindable] public var oficina:String;
		
		public function Ofcar(id:Number,oficina:String)
		{
			this.id = id;
			this.oficina = oficina;
		}

	}
}