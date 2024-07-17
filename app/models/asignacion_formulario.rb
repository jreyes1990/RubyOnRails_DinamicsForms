class AsignacionFormulario < ApplicationRecord
  belongs_to :config_formulario

  def destroy
    self.update_attribute(:estado, "I") # Cambia 'eliminado' por el estado deseado
  end
end
