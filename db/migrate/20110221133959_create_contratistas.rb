class CreateContratistas < ActiveRecord::Migration
  def self.up
    create_table :contratistas do |t|
      t.string :nombre

      t.timestamps
    end
    
    Contratista.create(:nombre=>'Edesal')
    Contratista.create(:nombre=>'Edelar')
    Contratista.create(:nombre=>'Edesa')
    Contratista.create(:nombre=>'Emdersa')
    
  end

  def self.down
    drop_table :contratistas
  end
end
