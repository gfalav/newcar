class CreateMovils < ActiveRecord::Migration
  def self.up
    create_table :movils do |t|
      t.string :nombre
      t.integer :ofcar_id

      t.timestamps
    end
    
    Movil.create(:nombre=>'Braga - Salvano',:ofcar_id=>1)
    Movil.create(:nombre=>'Cecconato - Falavigna',:ofcar_id=>1)
  end

  def self.down
    drop_table :movils
  end
end
