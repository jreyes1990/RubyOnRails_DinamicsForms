class ConfigFormulario < ApplicationRecord
  belongs_to :tipo_formulario
  has_many :asignacion_formularios, dependent: :destroy

  accepts_nested_attributes_for :asignacion_formularios, reject_if: :all_blank, allow_destroy: true, update_only: true

  # Validaciones
  validates :nombre, presence: true, length: { maximum: 50 }
  validates :app_siga, inclusion: { in: %w(S N), message: "%{value} no es una opción válida" }
  validates :descripcion, presence: { message: "no puede estar en blanco"}
  validate :descripcion_length_validation

  before_save :assign_values_to_asignacion_formularios

  def destroy
    self.update_attribute(:estado, "I") # Cambia 'eliminado' por el estado deseado
    # self.update_column(:estado, "I") # Cambia 'eliminado' por el estado deseado
  end

  private
  def descripcion_length_validation
    return if descripcion.blank?
    
    if descripcion.present? && descripcion.length < 10
      errors.add(:descripcion, "es demasiado corta (mínimo son 10 caracteres)")
    elsif descripcion.present? && descripcion.length > 255
      errors.add(:descripcion, "es demasiado larga (máximo son 255 caracteres)")  
    end
  end

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
