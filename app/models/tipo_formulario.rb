class TipoFormulario < ApplicationRecord
  has_many :config_formularios, dependent: :destroy

  accepts_nested_attributes_for :config_formularios, reject_if: :all_blank, allow_destroy: true, update_only: true

  # Validaciones
  validates :nombre, presence: { message: "no puede estar en blanco"}
  # Validaciones personalizadas
  validate :custom_uniqueness_validation

  before_save :assign_values_to_config_formularios

  def custom_uniqueness_validation
    error_messages = []
    config_formularios.each do |config_formulario|
      unless config_formulario.valid?
        config_formulario.errors.full_messages.each do |msg|
          error_messages << msg unless error_messages.include?(msg)
        end
      end
    end
    errors.add(:base, error_messages.uniq.join(", ")) unless error_messages.empty?
  end

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
