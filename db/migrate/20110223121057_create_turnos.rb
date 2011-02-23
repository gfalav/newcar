class CreateTurnos < ActiveRecord::Migration
  def self.up
    create_table :turnos do |t|
      t.date :fturno
      t.integer :tturno_id
      t.integer :ofcar_id
      t.integer :movil_id

      t.timestamps
    end
    
    Turno.create(:fturno=>'2011-02-15',:tturno_id=>1,:ofcar_id=>1,:movil_id=>1)
    Turno.create(:fturno=>'2011-02-16',:tturno_id=>1,:ofcar_id=>1,:movil_id=>1)
    Turno.create(:fturno=>'2011-02-17',:tturno_id=>1,:ofcar_id=>1,:movil_id=>1)
    Turno.create(:fturno=>'2011-02-18',:tturno_id=>1,:ofcar_id=>1,:movil_id=>1)
    Turno.create(:fturno=>'2011-02-19',:tturno_id=>1,:ofcar_id=>1,:movil_id=>1)
    Turno.create(:fturno=>'2011-02-20',:tturno_id=>1,:ofcar_id=>1,:movil_id=>1)
    Turno.create(:fturno=>'2011-02-21',:tturno_id=>1,:ofcar_id=>1,:movil_id=>1)
    Turno.create(:fturno=>'2011-02-22',:tturno_id=>1,:ofcar_id=>1,:movil_id=>1)
    Turno.create(:fturno=>'2011-02-23',:tturno_id=>1,:ofcar_id=>1,:movil_id=>1)
    Turno.create(:fturno=>'2011-02-24',:tturno_id=>1,:ofcar_id=>1,:movil_id=>1)
  end

  def self.down
    drop_table :turnos
  end
end
