class AsignacionFormulario < ApplicationRecord
  belongs_to :config_formulario

  # validates :departamento_id, uniqueness: { scope: [:config_formulario_id, :empresa_id, :area_id, :seccion_id, :subseccion_id, :empleado_id], message: "La combinación que desea registrar ya existe." }
  validates :departamento_id, uniqueness: {case_sensitive: true, scope: [:config_formulario_id, :empresa_id, :area_id, :departamento_id, :seccion_id, :subseccion_id, :empleado_id], message: ": La combinación que desea registrar ya existe." }

  def destroy
    self.update_attribute(:estado, "I") # Cambia 'eliminado' por el estado deseado
  end
end