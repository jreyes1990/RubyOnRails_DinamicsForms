class CreateTipoFormularios < ActiveRecord::Migration[6.0]
  def change
    create_table :tipo_formularios do |t|
      t.integer :empresa_id
      t.integer :area_id
      t.string :nombre, limit: 5
      t.string :descripcion, limit: 100
      t.integer :user_created_id
      t.integer :user_updated_id
      t.string :usr_grab, limit: 50
      t.string :usr_modi, limit: 50
      t.string :estado, limit: 5

      t.timestamps
    end
  end
end
