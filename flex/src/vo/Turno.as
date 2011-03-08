package vo
{
	public class Turno
	{
		[Bindable] public var id:Number;
		[Bindable] public var tturno:Number;
		[Bindable] public var fturno:Date;
		[Bindable] public var ofcar_id:Number;
		[Bindable] public var movil_id:Number;
		[Bindable] public var movil:String;
		
		public function Turno(id:Number,tturno:Number,fturno:Date,ofcar_id:Number,movil_id:Number,movil:String)
		{
			this.id = id;
			this.tturno = tturno;
			this.fturno = fturno;
			this.ofcar_id = ofcar_id;
			this.movil_id = movil_id;
			this.movil = movil; 
		}

	}
}