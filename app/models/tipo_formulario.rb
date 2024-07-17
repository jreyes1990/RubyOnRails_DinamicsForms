class TipoFormulario < ApplicationRecord
  has_many :config_formularios, dependent: :destroy

  accepts_nested_attributes_for :config_formularios, reject_if: :all_blank, allow_destroy: true, update_only: true

  before_save :assign_values_to_config_formularios

  private
  def assign_values_to_config_formularios
    self.config_formularios.each do |config_formulario|
      if config_formulario.new_record?  # Verifica si el registro es nuevo
        config_formulario.empresa_id = self.empresa_id
        config_formulario.area_id = self.area_id
        config_formulario.estado = self.estado
        config_formulario.user_created_id = self.user_created_id
      end
      # Siempre actualiza user_updated_id independientemente si es nuevo o no
      config_formulario.user_updated_id = self.user_updated_id
    end
  end
end
