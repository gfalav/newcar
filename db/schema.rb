# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110222125508) do

  create_table "actividads", :force => true do |t|
    t.integer  "cuenta_id"
    t.text     "descripcion"
    t.date     "factividad"
    t.float    "hscar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contratistas", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cuentas", :force => true do |t|
    t.string   "nombre"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movils", :force => true do |t|
    t.string   "nombre"
    t.integer  "ofcar_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ofcars", :force => true do |t|
    t.string   "oficina"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personals", :force => true do |t|
    t.string   "apellido"
    t.string   "nombre"
    t.string   "documento"
    t.string   "telefono"
    t.string   "direccion"
    t.integer  "contratista_id"
    t.integer  "movil_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tvehiculos", :force => true do |t|
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "usuario"
    t.string   "password"
    t.string   "nombre"
    t.string   "perfil"
    t.date     "fvctopass"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehiculos", :force => true do |t|
    t.string   "patente"
    t.string   "marca"
    t.string   "modelo"
    t.integer  "afabric"
    t.integer  "tvehiculo_id"
    t.integer  "movil_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
