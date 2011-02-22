class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.string :usuario
      t.string :password
      t.string :nombre
      t.string :perfil
      t.date :fvctopass

      t.timestamps
    end
    
    Usuario.create(:usuario=>'gfalavigna', :password=>'e9cf0325b9947415186fc2c18928357e',:nombre=>'Gustavo Falavigna',:perfil=>'Administrador',:fvctopass=>'2020-12-31')
    Usuario.create(:usuario=>'gcoltrinari',:password=>'7f72a4e0f2efd5c16c2083afa9996c12',:nombre=>'Guillermo Coltrinari',:perfil=>'Administrador',:fvctopass=>'2020-12-31')
    Usuario.create(:usuario=>'mlombardini',:password=>'fd2d3a80ad2ea9a25df906fa06d219a0',:nombre=>'Martin Lombardini',:perfil=>'Administrador',:fvctopass=>'2020-12-31')
    
  end

  def self.down
    drop_table :usuarios
  end
end
