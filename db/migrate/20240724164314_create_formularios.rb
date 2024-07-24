class CreateFormularios < ActiveRecord::Migration[6.0]
  def change
    create_table :formularios do |t|
      t.references :config_formulario, null: false, foreign_key: true
      t.integer :empresa_id
      t.integer :area_id
      t.integer :departamento_id
      t.integer :seccion_id
      t.integer :subseccion_id
      t.integer :labor_oracle_id
      t.integer :labor_madre_id
      t.integer :ot_id
      t.datetime :fecha_inicio_ejecucion
      t.datetime :fecha_fin_ejecucion
      t.text :coord_latitud
      t.text :coord_longitud
      t.integer :empleado_id
      t.integer :usuario_id
      t.datetime :fecha_sincronizacion
      t.integer :user_created_id
      t.integer :user_updated_id
      t.string :usr_grab, limit: 50
      t.string :usr_modi, limit: 50
      t.string :estado, limit: 10

      t.timestamps
    end
  end
end
