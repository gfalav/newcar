package vo
{
	public class Usuario
	{
		public var id:Number;
		public var usuario:String;
		public var password:String;
		public var nombre:String;
		public var perfil:String;
		public var fvctopass:Date;
		
		public function Usuario(id:Number,
								usuario:String,
								password:String,
								nombre:String,
								perfil:String,
								fvctopass:Date)
		{
			this.id = id;
			this.usuario = usuario;
			this.password = password;
			this.nombre = nombre;
			this.perfil = perfil;
			this.fvctopass = fvctopass;
		}

	}
}