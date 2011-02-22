class CreatePersonals < ActiveRecord::Migration
  def self.up
    create_table :personals do |t|
      t.string :apellido
      t.string :nombre
      t.string :documento
      t.string :telefono
      t.string :direccion
      t.integer :contratista_id

      t.timestamps
    end
    
    Personal.create(:apellido=>'Braga',:nombre=>'Leonardo',:documento=>'111111111',:telefono=>'38715111111111',:direccion=>'Pje Zorrilla 000',:contratista_id=>1)
    Personal.create(:apellido=>'Salvano',:nombre=>'Jorge',:documento=>'222222222',:telefono=>'38715222222222',:direccion=>'Pje Zorrilla 111',:contratista_id=>2)
    Personal.create(:apellido=>'Cecconato',:nombre=>'Gabriel',:documento=>'333333333',:telefono=>'38715333333333',:direccion=>'Pje Zorrilla 222',:contratista_id=>3)
    Personal.create(:apellido=>'Falavigna',:nombre=>'Gustavo',:documento=>'444444444',:telefono=>'38715444444444',:direccion=>'Pje Zorrilla 333',:contratista_id=>4)
  end

  def self.down
    drop_table :personals
  end
end
