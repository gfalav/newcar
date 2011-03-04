class CreateOfcars < ActiveRecord::Migration
  def self.up
    create_table :ofcars do |t|
      t.string :oficina

      t.timestamps
    end
    
    Ofcar.create(:oficina=>'San Luis Capital')
    Ofcar.create(:oficina=>'La Toma')
    Ofcar.create(:oficina=>'Quines')
    Ofcar.create(:oficina=>'Merlo')
    Ofcar.create(:oficina=>'Villa Mercedes')
    Ofcar.create(:oficina=>'Fortuna')
  end

  def self.down
    drop_table :ofcars
  end
end
