class CreateTturnos < ActiveRecord::Migration
  def self.up
    create_table :tturnos do |t|
      t.integer :turno
      t.string :desc

      t.timestamps
    end
    
    Tturno.create(:turno=>1,:desc=>'de 08:00 a 16:00')
    Tturno.create(:turno=>2,:desc=>'de 16:00 a 24:00')
    Tturno.create(:turno=>3,:desc=>'de 24:00 a 08:00')
    Tturno.create(:turno=>4,:desc=>'de 06:00 a 14:00')
    Tturno.create(:turno=>5,:desc=>'de 10:00 a 18:00')
  end

  def self.down
    drop_table :tturnos
  end
end
