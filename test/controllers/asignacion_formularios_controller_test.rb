require 'test_helper'

class AsignacionFormulariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @asignacion_formulario = asignacion_formularios(:one)
  end

  test "should get index" do
    get asignacion_formularios_url
    assert_response :success
  end

  test "should get new" do
    get new_asignacion_formulario_url
    assert_response :success
  end

  test "should create asignacion_formulario" do
    assert_difference('AsignacionFormulario.count') do
      post asignacion_formularios_url, params: { asignacion_formulario: { area_id: @asignacion_formulario.area_id, config_formulario_id: @asignacion_formulario.config_formulario_id, departamento_id: @asignacion_formulario.departamento_id, empleado_id: @asignacion_formulario.empleado_id, empresa_id: @asignacion_formulario.empresa_id, estado: @asignacion_formulario.estado, seccion_id: @asignacion_formulario.seccion_id, subseccion_id: @asignacion_formulario.subseccion_id, user_created_id: @asignacion_formulario.user_created_id, user_updated_id: @asignacion_formulario.user_updated_id, usr_grab: @asignacion_formulario.usr_grab, usr_modi: @asignacion_formulario.usr_modi } }
    end

    assert_redirected_to asignacion_formulario_url(AsignacionFormulario.last)
  end

  test "should show asignacion_formulario" do
    get asignacion_formulario_url(@asignacion_formulario)
    assert_response :success
  end

  test "should get edit" do
    get edit_asignacion_formulario_url(@asignacion_formulario)
    assert_response :success
  end

  test "should update asignacion_formulario" do
    patch asignacion_formulario_url(@asignacion_formulario), params: { asignacion_formulario: { area_id: @asignacion_formulario.area_id, config_formulario_id: @asignacion_formulario.config_formulario_id, departamento_id: @asignacion_formulario.departamento_id, empleado_id: @asignacion_formulario.empleado_id, empresa_id: @asignacion_formulario.empresa_id, estado: @asignacion_formulario.estado, seccion_id: @asignacion_formulario.seccion_id, subseccion_id: @asignacion_formulario.subseccion_id, user_created_id: @asignacion_formulario.user_created_id, user_updated_id: @asignacion_formulario.user_updated_id, usr_grab: @asignacion_formulario.usr_grab, usr_modi: @asignacion_formulario.usr_modi } }
    assert_redirected_to asignacion_formulario_url(@asignacion_formulario)
  end

  test "should destroy asignacion_formulario" do
    assert_difference('AsignacionFormulario.count', -1) do
      delete asignacion_formulario_url(@asignacion_formulario)
    end

    assert_redirected_to asignacion_formularios_url
  end
end
