class ConfigFormulariosController < ApplicationController
  before_action :set_config_formulario, only: %i[ show edit update destroy step update_step finish]

  # GET /config_formularios or /config_formularios.json
  def index
    @config_formularios = ConfigFormulario.all
  end

  # GET /config_formularios/1 or /config_formularios/1.json
  def show
  end

  # GET /config_formularios/new
  def new
    @config_formulario = ConfigFormulario.new
  end

  # GET /config_formularios/1/edit
  def edit
  end

  # POST /config_formularios or /config_formularios.json
  def create
    @config_formulario = ConfigFormulario.new(config_formulario_params)
    @config_formulario.user_created_id = 1
    @config_formulario.estado = "A"

    respond_to do |format|
      if @config_formulario.save
        format.html { redirect_to step_config_formulario_path(@config_formulario, step: 1), notice: "Config formulario was successfully created." }
        format.json { render :show, status: :created, location: @config_formulario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @config_formulario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /config_formularios/1 or /config_formularios/1.json
  def update
    respond_to do |format|
      if @config_formulario.update(config_formulario_params)
        format.html { redirect_to step_config_formulario_path(@config_formulario, step: 1), notice: "Config formulario was successfully updated." }
        format.json { render :show, status: :ok, location: @config_formulario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @config_formulario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /config_formularios/1 or /config_formularios/1.json
  def destroy
    @config_formulario.destroy

    respond_to do |format|
      format.html { redirect_to config_formularios_url, notice: "Config formulario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def step
    @step = params[:step].to_i
  end

  def update_step
    @step = params[:step].to_i
    if @config_formulario.update(config_formulario_params)
      if @step < 2
        redirect_to step_config_formulario_path(@config_formulario, step: @step + 1)
      else
        redirect_to finish_config_formulario_path(@config_formulario)
      end
    else
      render :step
    end
  end

  def finish
    @config_formulario = ConfigFormulario.find(params[:id])
    # Aquí puedes realizar cualquier operación final antes de mostrar el resumen
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_config_formulario
      @config_formulario = ConfigFormulario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def config_formulario_params
      params.require(:config_formulario).permit(ConfigFormulario.attribute_names.map(&:to_sym).push(:_destroy), asignacion_formularios_attributes: AsignacionFormulario.attribute_names.map(&:to_sym).push(:_destroy))
    end
end
