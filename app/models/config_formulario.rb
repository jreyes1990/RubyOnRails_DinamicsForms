class ConfigFormulario < ApplicationRecord
  belongs_to :tipo_formulario
  has_many :asignacion_formularios, dependent: :destroy

  accepts_nested_attributes_for :asignacion_formularios, reject_if: :all_blank, allow_destroy: true, update_only: true

  def destroy
    self.update_attribute(:estado, "I") # Cambia 'eliminado' por el estado deseado
    # self.update_column(:estado, "I") # Cambia 'eliminado' por el estado deseado
  end

  before_save :assign_values_to_asignacion_formularios

  private
  def assign_values_to_asignacion_formularios
    self.asignacion_formularios.each do |asig_formulario|
      if asig_formulario.new_record?  # Verifica si el registro es nuevo
        asig_formulario.empresa_id = self.empresa_id
        asig_formulario.area_id = self.area_id
        asig_formulario.estado = self.estado
        asig_formulario.user_created_id = self.user_created_id
      end
      # Siempre actualiza user_updated_id independientemente si es nuevo o no
      asig_formulario.user_updated_id = self.user_updated_id
    end
  end
end
