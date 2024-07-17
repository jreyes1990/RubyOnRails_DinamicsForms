class TipoFormulariosController < ApplicationController
  before_action :set_tipo_formulario, only: %i[ show edit update destroy replicate]

  # GET /tipo_formularios or /tipo_formularios.json
  def index
    @tipo_formularios = TipoFormulario.all
  end

  # GET /tipo_formularios/1 or /tipo_formularios/1.json
  def show
  end

  # GET /tipo_formularios/new
  def new
    if params[:id].present?
      original_tipo_formulario = TipoFormulario.find(params[:id])
      @tipo_formulario = original_tipo_formulario.dup
      @tipo_formulario.empresa_id = params[:empresa_id] if params[:empresa_id].present?
      @tipo_formulario.area_id = params[:area_id] if params[:area_id].present?

      @tipo_formulario.config_formularios = original_tipo_formulario.config_formularios.map do |config_formulario|
        duplicated_config_formulario = config_formulario.dup
        duplicated_config_formulario.asignacion_formularios = config_formulario.asignacion_formularios.map(&:dup)
        duplicated_config_formulario
      end
    else
      @tipo_formulario = TipoFormulario.new
    end
    # @tipo_formulario.config_formularios.build
  end

  # GET /tipo_formularios/1/edit
  def edit
    @config_formularios_activos = @tipo_formulario.config_formularios.where(estado: 'A')
    # @tipo_formulario.config_formularios.build
  end

  # POST /tipo_formularios or /tipo_formularios.json
  def create
    @tipo_formulario = TipoFormulario.new(tipo_formulario_params)
    @tipo_formulario.user_created_id = 1
    @tipo_formulario.estado = "A"

    respond_to do |format|
      if @tipo_formulario.save
        format.html { redirect_to tipo_formulario_url(@tipo_formulario), notice: "Tipo formulario was successfully created." }
        format.json { render :show, status: :created, location: @tipo_formulario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tipo_formulario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_formularios/1 or /tipo_formularios/1.json
  def update
    
    respond_to do |format|
      if @tipo_formulario.update(tipo_formulario_params)
        format.html { redirect_to tipo_formulario_url(@tipo_formulario), notice: "Tipo formulario was successfully updated." }
        format.json { render :show, status: :ok, location: @tipo_formulario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tipo_formulario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_formularios/1 or /tipo_formularios/1.json
  def destroy
    @tipo_formulario.destroy

    respond_to do |format|
      format.html { redirect_to tipo_formularios_url, notice: "Tipo formulario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def replicate_all
    source_empresa_id = params[:source_empresa_id]
    source_area_id = params[:source_area_id]
    target_empresa_id = params[:target_empresa_id]
    target_area_id = params[:target_area_id]

    if source_empresa_id.present? && source_area_id.present? && target_empresa_id.present? && target_area_id.present?
      original_formularios = TipoFormulario.where(empresa_id: source_empresa_id, area_id: source_area_id)

      original_formularios.each do |original_tipo_formulario|
        new_tipo_formulario = original_tipo_formulario.dup
        new_tipo_formulario.empresa_id = target_empresa_id
        new_tipo_formulario.area_id = target_area_id

        new_tipo_formulario.config_formularios = original_tipo_formulario.config_formularios.map do |config_formulario|
          duplicated_config_formulario = config_formulario.dup
          duplicated_config_formulario.asignacion_formularios = config_formulario.asignacion_formularios.map(&:dup)
          duplicated_config_formulario
        end

        new_tipo_formulario.save
      end

      redirect_to tipo_formularios_path, notice: 'Formularios replicados con éxito.'
    else
      redirect_to tipo_formularios_path, alert: 'Debe proporcionar todos los parámetros.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_formulario
      @tipo_formulario = TipoFormulario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_formulario_params
      params.require(:tipo_formulario).permit(TipoFormulario.attribute_names.map(&:to_sym).push(:_destroy), config_formularios_attributes: ConfigFormulario.attribute_names.map(&:to_sym).push(:_destroy, asignacion_formularios_attributes: AsignacionFormulario.attribute_names.map(&:to_sym).push(:_destroy)))
    end
end
