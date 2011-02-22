class CreateActividads < ActiveRecord::Migration
  def self.up
    create_table :actividads do |t|
      t.integer :cuenta_id
      t.text :descripcion
      t.date :factividad
      t.float :hscar

      t.timestamps
    end
    
    Actividad.create(:cuenta_id=>9,:factividad=>'2011-01-10',:hscar=>40)
    Actividad.create(:cuenta_id=>9,:factividad=>'2011-02-10',:hscar=>40)
    Actividad.create(:cuenta_id=>9,:factividad=>'2011-03-10',:hscar=>40)
    Actividad.create(:cuenta_id=>9,:factividad=>'2011-04-10',:hscar=>40)
    Actividad.create(:cuenta_id=>10,:factividad=>'2011-01-10',:hscar=>40)
    Actividad.create(:cuenta_id=>10,:factividad=>'2011-02-10',:hscar=>40)
    Actividad.create(:cuenta_id=>10,:factividad=>'2011-03-10',:hscar=>40)
    Actividad.create(:cuenta_id=>10,:factividad=>'2011-04-10',:hscar=>40)

  end

  def self.down
    drop_table :actividads
  end
end
