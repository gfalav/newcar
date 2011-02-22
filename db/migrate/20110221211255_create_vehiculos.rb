class CreateVehiculos < ActiveRecord::Migration
  def self.up
    create_table :vehiculos do |t|
      t.string :patente
      t.string :marca
      t.string :modelo
      t.integer :afabric
      t.integer :tvehiculo_id

      t.timestamps
    end
    
    Vehiculo.create(:patente=>'aaa111',:marca=>'Ford',:modelo=>'Ranger',:afabric=>2011,:tvehiculo_id=>1)
    Vehiculo.create(:patente=>'bbb222',:marca=>'Chevrolet',:modelo=>'S10',:afabric=>2010,:tvehiculo_id=>1)
    Vehiculo.create(:patente=>'ccc333',:marca=>'VW',:modelo=>'Amarok',:afabric=>2009,:tvehiculo_id=>1)
    Vehiculo.create(:patente=>'ddd444',:marca=>'Toyota',:modelo=>'Hilux',:afabric=>2008,:tvehiculo_id=>1)
    
  end

  def self.down
    drop_table :vehiculos
  end
end
