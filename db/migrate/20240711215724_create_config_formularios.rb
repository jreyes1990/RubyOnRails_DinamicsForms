class CreateConfigFormularios < ActiveRecord::Migration[6.0]
  def change
    create_table :config_formularios, id: false, comment: "Catálogo Configuración de Formulario" do |t|
      t.serial :id, null: false, comment: "Identificador de la llave primaria"
      t.references :tipo_formulario, null: false, foreign_key: false, index: false, comment: "Identificador del tipo de formulario para la configuración del formulario"
      t.integer :empresa_id, null: false, comment: "Identificador de la empresa"
      t.integer :area_id, null: false, comment: "Identificador del área"
      t.string :nombre, limit: 50, null: false, comment: "Nombre de la configuración del formulario"
      t.string :descripcion, limit: 100, null: true, comment: "Descripción general de la configuración del formulario"
      t.string :app_siga, limit: 5, default: "N", comment: "Verifica si la configuración tiene SIGA: [A]: Activo;  [I]: Inactivo"
      t.integer :user_created_id, null: false, comment: "Identificador del usuario que realiza el registro desde la aplicación web"
      t.integer :user_updated_id, null: true, comment: "Identificador del usuario que realiza la actualización desde la aplicación web"
      t.string :usr_grab, limit: 50
      t.string :usr_modi, limit: 50
      t.string :estado, limit: 5, default: "A", comment: "Estado de la configuración del formulario: [A]: Activo;  [I]: Inactivo"

      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de creación del registro"
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de la última actualización del registro"
      # t.timestamps
    end

    # Crear el índice y la restricción de clave primaria con un nombre específico
    execute <<-SQL
      alter table config_formularios add
        constraint pk_configForm
        primary key (id)
    SQL

    # Agregar la clave foránea con el nombre personalizado
    add_foreign_key :config_formularios, :tipo_formularios, column: :tipo_formulario_id, name: 'fk_configForm_tipoForm'

    # Agregar el índice único con el nombre personalizado
    # add_index :config_formularios, [:tipo_formulario_id], name: "idx_configForm_tipoForm", unique: false
    # add_index :config_formularios, [:empresa_id, :area_id], name: "idx_configForm", unique: false

    # Agregar el índice único con el nombre personalizado en la combinación correcta de columnas
    add_index :config_formularios, [:tipo_formulario_id, :empresa_id, :area_id], name: "idx_configForm_tipoForm", unique: true

    # Agregar el constraint CHECK sin el punto y coma al final
    execute <<-SQL
      alter table config_formularios add
        constraint ck_estado_configForm
        check (estado in ('A', 'I'))
    SQL

    execute <<-SQL
      alter table config_formularios add
        constraint ck_appSiga_configForm
        check (app_siga in ('S', 'N'))
    SQL

    # Agregar comentarios a la tabla
    # execute <<-SQL
    #   comment on table config_formularios is 'Catálogo de Configuración de Formulario'
    # SQL

    # # Agregar comentarios a las columnas
    # execute <<-SQL
    #   comment on column config_formularios.id is 'Identificador de la llave primaria'
    # SQL

    # execute <<-SQL
    #   comment on column config_formularios.created_at is 'Fecha y hora al registrar datos'
    # SQL

    # execute <<-SQL
    #   comment on column config_formularios.updated_at is 'Fecha y hora al actualizar datos'
    # SQL
  end
end
