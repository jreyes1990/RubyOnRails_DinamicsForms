class CreateAsignacionFormularios < ActiveRecord::Migration[6.0]
  def change
    create_table :asignacion_formularios, id: false, comment: "Módulo Asignación de Formulario" do |t|
      t.serial :id, null: false, comment: "Identificador de la llave primaria"
      t.references :config_formulario, null: false, foreign_key: false, index: false, comment: "Identificador de la configuración de formulario para la asignación del formulario"
      t.integer :empresa_id, null: false, comment: "Identificador de la empresa"
      t.integer :area_id, null: false, comment: "Identificador del área"
      t.integer :departamento_id, null: false, default: 0, comment: "Identificador del departamento"
      t.integer :seccion_id, null: false, default: 0, comment: "Identificador de la sección"
      t.integer :subseccion_id, null: false, default: 0, comment: "Identificador de la subsección"
      t.integer :empleado_id, null: true, comment: "Identificador del empleado"
      t.integer :user_created_id, null: false, comment: "Identificador del usuario que realiza el registro desde la aplicación web"
      t.integer :user_updated_id, null: true, comment: "Identificador del usuario que realiza la actualización desde la aplicación web"
      t.string :usr_grab, limit: 50
      t.string :usr_modi, limit: 50
      t.string :estado, limit: 5, default: "A", comment: "Estado de la asignación del formulario: [A]: Activo;  [I]: Inactivo"

      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de creación del registro"
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de la última actualización del registro"
      # t.timestamps
    end

    # Crear el índice y la restricción de clave primaria con un nombre específico
    execute <<-SQL
      alter table asignacion_formularios add
        constraint pk_asignaForm 
        primary key (id)
    SQL

    # Agregar la clave foránea con el nombre personalizado
    add_foreign_key :asignacion_formularios, :config_formularios, column: :config_formulario_id, name: 'fk_asignaForm_configForm'

    # Agregar el índice único con el nombre personalizado
    add_index :asignacion_formularios, [:config_formulario_id], name: "idx_asignaForm_configForm", unique: true
    add_index :asignacion_formularios, [:empresa_id, :area_id, :departamento_id, :seccion_id, :subseccion_id, :empleado_id], name: "idx_asignaForm", unique: true

    # Agregar el constraint CHECK sin el punto y coma al final
    execute <<-SQL
      alter table asignacion_formularios add
        constraint ck_estado_asignaForm
        check (estado in ('A', 'I'))
    SQL

    # Agregar comentarios a la tabla
    # execute <<-SQL
    #   comment on table asignacion_formularios is 'Módulo Asignación de Formulario'
    # SQL

    # # Agregar comentarios a las columnas
    # execute <<-SQL
    #   comment on column asignacion_formularios.id is 'Identificador de la llave primaria'
    # SQL

    # execute <<-SQL
    #   comment on column asignacion_formularios.created_at is 'Fecha y hora al registrar datos'
    # SQL

    # execute <<-SQL
    #   comment on column asignacion_formularios.updated_at is 'Fecha y hora al actualizar datos'
    # SQL
  end
end
