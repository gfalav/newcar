class CreateCuentas < ActiveRecord::Migration
  def self.up
    create_table :cuentas do |t|
      t.string :nombre
      t.string :ancestry

      t.timestamps
    end
    
    Cuenta.create(:nombre=>'Raiz')
    Cuenta.create(:nombre=>'Comercial',:ancestry=>'1')
    Cuenta.create(:nombre=>'Distribucion',:ancestry=>'1')
    Cuenta.create(:nombre=>'At Clientes',:ancestry=>'1/2')
    Cuenta.create(:nombre=>'Gest Impagados',:ancestry=>'1/2')
    Cuenta.create(:nombre=>'Gest Perdidas',:ancestry=>'1/2')
    Cuenta.create(:nombre=>'NNSS',:ancestry=>'1/2')
    Cuenta.create(:nombre=>'Mant Acometidas',:ancestry=>'1/2')
    Cuenta.create(:nombre=>'Suspensiones',:ancestry=>'1/2/5')
    Cuenta.create(:nombre=>'Reanudaciones',:ancestry=>'1/2/5')
    Cuenta.create(:nombre=>'Baja por Impago',:ancestry=>'1/2/5')
    Cuenta.create(:nombre=>'Reconexiones',:ancestry=>'1/2/5')
    Cuenta.create(:nombre=>'Revision de Baja',:ancestry=>'1/2/5')
    Cuenta.create(:nombre=>'Cambio de Emplazamiento de Medidor',:ancestry=>'1/2/4')
    Cuenta.create(:nombre=>'Estudio Modificacion de Red',:ancestry=>'1/2/4')
    Cuenta.create(:nombre=>'Levantamiento por Baja Voluntaria',:ancestry=>'1/2/4')
    Cuenta.create(:nombre=>'Reclamo por Artefactos Danados',:ancestry=>'1/2/4')
    Cuenta.create(:nombre=>'Revision de Datos Suministro',:ancestry=>'1/2/4')
    Cuenta.create(:nombre=>'Cambio de Acometidas',:ancestry=>'1/2/8')
    Cuenta.create(:nombre=>'Cambio de Medidor',:ancestry=>'1/2/8')
    Cuenta.create(:nombre=>'Normalizacion de suministro',:ancestry=>'1/2/8')
    Cuenta.create(:nombre=>'Mantenimiento MT',:ancestry=>'1/3')
    Cuenta.create(:nombre=>'Mantenimiento linea 13,2kV',:ancestry=>'1/3/24')
    Cuenta.create(:nombre=>'Mantenimiento linea 33kV',:ancestry=>'1/3/24')
    Cuenta.create(:nombre=>'Mantenimiento SETA',:ancestry=>'1/3/24')
    Cuenta.create(:nombre=>'Extension Red',:ancestry=>'1/3')
    Cuenta.create(:nombre=>'Extension Red BT',:ancestry=>'1/3/28')
    Cuenta.create(:nombre=>'Extension Red MT',:ancestry=>'1/3/28')
    Cuenta.create(:nombre=>'Construccion CT Monoposte',:ancestry=>'1/3/28')
    Cuenta.create(:nombre=>'Relevamiento de AP',:ancestry=>'1/2/6')
    Cuenta.create(:nombre=>'Factibilidad y Conexion de Suministro',:ancestry=>'1/2/7')
    Cuenta.create(:nombre=>'Ejecucion de Obra NNSS',:ancestry=>'1/2/7')
    Cuenta.create(:nombre=>'Fraude por SETA',:ancestry=>'1/2/6')
    Cuenta.create(:nombre=>'Inspeccion y Normalizacion',:ancestry=>'1/2/6')
    Cuenta.create(:nombre=>'Fraude Nocturno/Diurno',:ancestry=>'1/2/6')
    Cuenta.create(:nombre=>'Construccion CT Biposte',:ancestry=>'1/3/28')
    
  end

  def self.down
    drop_table :cuentas
  end
end
