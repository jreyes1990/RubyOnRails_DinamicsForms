class CreateTipoFormularios < ActiveRecord::Migration[6.0]
  def change
    create_table :tipo_formularios, id: false, comment: "Catálogo Tipo de Formulario" do |t|
      t.serial :id, null: false, comment: "Identificador de la llave primaria"
      t.integer :empresa_id, null: false, comment: "Identificador de la empresa"
      t.integer :area_id, null: false, comment: "Identificador del área"
      t.string :nombre, limit: 50, null: false, comment: "Nombre de tipo de formulario"
      t.string :descripcion, limit: 100, null: true, comment: "Descripción general del tipo de formulario"
      t.integer :user_created_id, null: false, comment: "Identificador del usuario que realiza el registro desde la aplicación web"
      t.integer :user_updated_id, null: true, comment: "Identificador del usuario que realiza la actualización desde la aplicación web"
      t.string :usr_grab, limit: 50
      t.string :usr_modi, limit: 50
      t.string :estado, limit: 5, default: "A", comment: "Estado del tipo de formulario: [A]: Activo;  [I]: Inactivo"

      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de creación del registro"
      t.datetime :updated_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: "Fecha y hora de la última actualización del registro"
      # t.timestamps
    end

    # Crear el índice y la restricción de clave primaria con un nombre específico
    execute <<-SQL
      alter table tipo_formularios add
        constraint pk_tipoForm
        primary key (id)
    SQL

    # Agregar el índice único con el nombre personalizado
    add_index :tipo_formularios, [:empresa_id, :area_id], name: "idx_tipoForm_areaEmp", unique: false

    # Agregar el constraint CHECK sin el punto y coma al final
    execute <<-SQL
     alter table tipo_formularios add
       constraint ck_estado_tipoForm
       check (estado in ('A', 'I'))
    SQL

    # Agregar comentarios a la tabla
    #execute <<-SQL
    #  comment on table tipo_formularios is 'Catálogo de Tipo de Formulario'
    #SQL

    # Agregar comentarios a las columnas
    #execute <<-SQL
    #  comment on column tipo_formularios.id is 'Identificador de la llave primaria'
    #SQL

    #execute <<-SQL
    #  comment on column tipo_formularios.created_at is 'Fecha y hora al registrar datos'
    #SQL

    #execute <<-SQL
    #  comment on column tipo_formularios.updated_at is 'Fecha y hora al actualizar datos'
    #SQL
  end
end
