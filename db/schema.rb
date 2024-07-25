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

ActiveRecord::Schema.define(version: 2024_07_24_164314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asignacion_formularios", id: :serial, comment: "Módulo Asignación de Formulario", force: :cascade do |t|
    t.bigint "config_formulario_id", null: false, comment: "Identificador de la configuración de formulario para la asignación del formulario"
    t.integer "empresa_id", null: false, comment: "Identificador de la empresa"
    t.integer "area_id", null: false, comment: "Identificador del área"
    t.integer "departamento_id", default: 0, null: false, comment: "Identificador del departamento"
    t.integer "seccion_id", default: 0, null: false, comment: "Identificador de la sección"
    t.integer "subseccion_id", default: 0, null: false, comment: "Identificador de la subsección"
    t.integer "empleado_id", comment: "Identificador del empleado"
    t.integer "user_created_id", null: false, comment: "Identificador del usuario que realiza el registro desde la aplicación web"
    t.integer "user_updated_id", comment: "Identificador del usuario que realiza la actualización desde la aplicación web"
    t.string "usr_grab", limit: 50
    t.string "usr_modi", limit: 50
    t.string "estado", limit: 5, default: "A", comment: "Estado de la asignación del formulario: [A]: Activo;  [I]: Inactivo"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["config_formulario_id", "empresa_id", "area_id", "departamento_id", "seccion_id", "subseccion_id", "empleado_id"], name: "idx_asignaForm_configForm"
  end

  create_table "config_formularios", id: :serial, comment: "Catálogo Configuración de Formulario", force: :cascade do |t|
    t.bigint "tipo_formulario_id", null: false, comment: "Identificador del tipo de formulario para la configuración del formulario"
    t.integer "empresa_id", null: false, comment: "Identificador de la empresa"
    t.integer "area_id", null: false, comment: "Identificador del área"
    t.string "nombre", limit: 50, null: false, comment: "Nombre de la configuración del formulario"
    t.string "descripcion", limit: 100, comment: "Descripción general de la configuración del formulario"
    t.string "app_siga", limit: 5, default: "N", comment: "Verifica si la configuración tiene SIGA: [A]: Activo;  [I]: Inactivo"
    t.integer "user_created_id", null: false, comment: "Identificador del usuario que realiza el registro desde la aplicación web"
    t.integer "user_updated_id", comment: "Identificador del usuario que realiza la actualización desde la aplicación web"
    t.string "usr_grab", limit: 50
    t.string "usr_modi", limit: 50
    t.string "estado", limit: 5, default: "A", comment: "Estado de la configuración del formulario: [A]: Activo;  [I]: Inactivo"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["tipo_formulario_id", "empresa_id", "area_id"], name: "idx_configForm_tipoForm"
  end

  create_table "formularios", force: :cascade do |t|
    t.bigint "config_formulario_id", null: false
    t.integer "empresa_id"
    t.integer "area_id"
    t.integer "departamento_id"
    t.integer "seccion_id"
    t.integer "subseccion_id"
    t.integer "labor_oracle_id"
    t.integer "labor_madre_id"
    t.integer "ot_id"
    t.datetime "fecha_inicio_ejecucion"
    t.datetime "fecha_fin_ejecucion"
    t.text "coord_latitud"
    t.text "coord_longitud"
    t.integer "empleado_id"
    t.integer "usuario_id"
    t.datetime "fecha_sincronizacion"
    t.integer "user_created_id"
    t.integer "user_updated_id"
    t.string "usr_grab", limit: 50
    t.string "usr_modi", limit: 50
    t.string "estado", limit: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["config_formulario_id"], name: "index_formularios_on_config_formulario_id"
  end

  create_table "tipo_formularios", id: :serial, comment: "Catálogo Tipo de Formulario", force: :cascade do |t|
    t.integer "empresa_id", null: false, comment: "Identificador de la empresa"
    t.integer "area_id", null: false, comment: "Identificador del área"
    t.string "nombre", limit: 50, null: false, comment: "Nombre de tipo de formulario"
    t.string "descripcion", limit: 100, comment: "Descripción general del tipo de formulario"
    t.integer "user_created_id", null: false, comment: "Identificador del usuario que realiza el registro desde la aplicación web"
    t.integer "user_updated_id", comment: "Identificador del usuario que realiza la actualización desde la aplicación web"
    t.string "usr_grab", limit: 50
    t.string "usr_modi", limit: 50
    t.string "estado", limit: 5, default: "A", comment: "Estado del tipo de formulario: [A]: Activo;  [I]: Inactivo"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Fecha y hora de creación del registro"
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Fecha y hora de la última actualización del registro"
    t.index ["empresa_id", "area_id"], name: "idx_tipoForm_areaEmp"
  end

  add_foreign_key "asignacion_formularios", "config_formularios", name: "fk_asignaForm_configForm"
  add_foreign_key "config_formularios", "tipo_formularios", name: "fk_configForm_tipoForm"
  add_foreign_key "formularios", "config_formularios"
end
