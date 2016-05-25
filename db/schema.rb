# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160505003658) do

  create_table "diagnosticos", force: :cascade do |t|
    t.datetime "fecha"
    t.text     "description",       limit: 65535
    t.integer  "persona_id",        limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "especialidad_id",   limit: 255
    t.integer  "hospital",          limit: 4
    t.integer  "padecimiento",      limit: 4
    t.integer  "tipo_padecimiento", limit: 4
  end

  create_table "direccions", force: :cascade do |t|
    t.integer  "persona_id",       limit: 4
    t.integer  "provincia",        limit: 4
    t.integer  "canton",           limit: 4
    t.integer  "distrito",         limit: 4
    t.text     "direccion_exacta", limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "historial_clinicos", force: :cascade do |t|
    t.integer  "persona_id",   limit: 4
    t.datetime "fecha"
    t.integer  "fk_id_lookup", limit: 4
    t.integer  "orden",        limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "info_contactos", force: :cascade do |t|
    t.string   "telefono",        limit: 255
    t.string   "nombre_contacto", limit: 255
    t.string   "parentesco",      limit: 255
    t.integer  "persona_id",      limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "info_extra_pacientes", force: :cascade do |t|
    t.boolean  "estudiante"
    t.boolean  "trabajador"
    t.string   "lugar_estudio_trabajo",  limit: 255
    t.boolean  "hijos"
    t.integer  "cant_hijos",             limit: 4
    t.boolean  "referencia_trab_social"
    t.boolean  "ayuda_alimentos"
    t.boolean  "ayuda_medicamento"
    t.string   "persona_id",             limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "cant_hermanos",          limit: 4
  end

  create_table "lookups", force: :cascade do |t|
    t.integer  "parent",      limit: 4
    t.string   "value",       limit: 255
    t.text     "descripcion", limit: 65535
    t.string   "lookup_type", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "personas", force: :cascade do |t|
    t.string   "nombre",             limit: 255
    t.string   "primer_apellido",    limit: 255
    t.string   "segundo_apellido",   limit: 255
    t.date     "fecha_nacimiento"
    t.string   "correo_electronico", limit: 255
    t.boolean  "genero"
    t.string   "cedula",             limit: 255
    t.integer  "estado_civil",       limit: 4
    t.string   "telefono",           limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "reports", force: :cascade do |t|
    t.string   "report_name", limit: 255
    t.string   "report_sql",  limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

end
