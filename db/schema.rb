# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_07_16_203008) do

  create_table "asignacion_formularios", force: :cascade do |t|
    t.integer "config_formulario_id", null: false
    t.integer "empresa_id"
    t.integer "area_id"
    t.integer "departamento_id"
    t.integer "seccion_id"
    t.integer "subseccion_id"
    t.integer "empleado_id"
    t.integer "user_created_id"
    t.integer "user_updated_id"
    t.string "usr_grab", limit: 50
    t.string "usr_modi", limit: 50
    t.string "estado", limit: 5
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["config_formulario_id"], name: "index_asignacion_formularios_on_config_formulario_id"
  end

  create_table "config_formularios", force: :cascade do |t|
    t.integer "empresa_id"
    t.integer "area_id"
    t.integer "tipo_formulario_id", null: false
    t.string "nombre", limit: 5
    t.string "descripcion", limit: 100
    t.string "app_siga", limit: 5
    t.integer "user_created_id"
    t.integer "user_updated_id"
    t.string "usr_grab", limit: 50
    t.string "usr_modi", limit: 50
    t.string "estado", limit: 5
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tipo_formulario_id"], name: "index_config_formularios_on_tipo_formulario_id"
  end

  create_table "tipo_formularios", force: :cascade do |t|
    t.integer "empresa_id"
    t.integer "area_id"
    t.string "nombre", limit: 5
    t.string "descripcion", limit: 100
    t.integer "user_created_id"
    t.integer "user_updated_id"
    t.string "usr_grab", limit: 50
    t.string "usr_modi", limit: 50
    t.string "estado", limit: 5
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "asignacion_formularios", "config_formularios"
  add_foreign_key "config_formularios", "tipo_formularios"
end
