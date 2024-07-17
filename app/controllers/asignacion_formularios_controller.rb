class AsignacionFormulariosController < ApplicationController
  before_action :set_asignacion_formulario, only: %i[ show edit update destroy ]

  # GET /asignacion_formularios or /asignacion_formularios.json
  def index
    @asignacion_formularios = AsignacionFormulario.all
  end

  # GET /asignacion_formularios/1 or /asignacion_formularios/1.json
  def show
  end

  # GET /asignacion_formularios/new
  def new
    @asignacion_formulario = AsignacionFormulario.new
  end

  # GET /asignacion_formularios/1/edit
  def edit
  end

  # POST /asignacion_formularios or /asignacion_formularios.json
  def create
    @asignacion_formulario = AsignacionFormulario.new(asignacion_formulario_params)

    respond_to do |format|
      if @asignacion_formulario.save
        format.html { redirect_to asignacion_formulario_url(@asignacion_formulario), notice: "Asignacion formulario was successfully created." }
        format.json { render :show, status: :created, location: @asignacion_formulario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @asignacion_formulario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asignacion_formularios/1 or /asignacion_formularios/1.json
  def update
    respond_to do |format|
      if @asignacion_formulario.update(asignacion_formulario_params)
        format.html { redirect_to asignacion_formulario_url(@asignacion_formulario), notice: "Asignacion formulario was successfully updated." }
        format.json { render :show, status: :ok, location: @asignacion_formulario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @asignacion_formulario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asignacion_formularios/1 or /asignacion_formularios/1.json
  def destroy
    @asignacion_formulario.destroy

    respond_to do |format|
      format.html { redirect_to asignacion_formularios_url, notice: "Asignacion formulario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asignacion_formulario
      @asignacion_formulario = AsignacionFormulario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def asignacion_formulario_params
      params.require(:asignacion_formulario).permit(:config_formulario_id, :empresa_id, :area_id, :departamento_id, :seccion_id, :subseccion_id, :empleado_id, :user_created_id, :user_updated_id, :usr_grab, :usr_modi, :estado)
    end
end
