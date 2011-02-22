class CreateOfcars < ActiveRecord::Migration
  def self.up
    create_table :ofcars do |t|
      t.string :oficina

      t.timestamps
    end
    
    Ofcar.create(:oficina=>'San Luis Capital')
  end

  def self.down
    drop_table :ofcars
  end
end
