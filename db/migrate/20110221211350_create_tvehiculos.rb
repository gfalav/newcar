class CreateTvehiculos < ActiveRecord::Migration
  def self.up
    create_table :tvehiculos do |t|
      t.string :tipo

      t.timestamps
    end
    
    Tvehiculo.create(:tipo=>'Camioneta')
    Tvehiculo.create(:tipo=>'Camion')
    Tvehiculo.create(:tipo=>'Moto')
    Tvehiculo.create(:tipo=>'Grua')
    
  end

  def self.down
    drop_table :tvehiculos
  end
end
