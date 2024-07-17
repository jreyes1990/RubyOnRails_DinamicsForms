require "application_system_test_case"

class AsignacionFormulariosTest < ApplicationSystemTestCase
  setup do
    @asignacion_formulario = asignacion_formularios(:one)
  end

  test "visiting the index" do
    visit asignacion_formularios_url
    assert_selector "h1", text: "Asignacion Formularios"
  end

  test "creating a Asignacion formulario" do
    visit asignacion_formularios_url
    click_on "New Asignacion Formulario"

    fill_in "Area", with: @asignacion_formulario.area_id
    fill_in "Config formulario", with: @asignacion_formulario.config_formulario_id
    fill_in "Departamento", with: @asignacion_formulario.departamento_id
    fill_in "Empleado", with: @asignacion_formulario.empleado_id
    fill_in "Empresa", with: @asignacion_formulario.empresa_id
    fill_in "Estado", with: @asignacion_formulario.estado
    fill_in "Seccion", with: @asignacion_formulario.seccion_id
    fill_in "Subseccion", with: @asignacion_formulario.subseccion_id
    fill_in "User created", with: @asignacion_formulario.user_created_id
    fill_in "User updated", with: @asignacion_formulario.user_updated_id
    fill_in "Usr grab", with: @asignacion_formulario.usr_grab
    fill_in "Usr modi", with: @asignacion_formulario.usr_modi
    click_on "Create Asignacion formulario"

    assert_text "Asignacion formulario was successfully created"
    click_on "Back"
  end

  test "updating a Asignacion formulario" do
    visit asignacion_formularios_url
    click_on "Edit", match: :first

    fill_in "Area", with: @asignacion_formulario.area_id
    fill_in "Config formulario", with: @asignacion_formulario.config_formulario_id
    fill_in "Departamento", with: @asignacion_formulario.departamento_id
    fill_in "Empleado", with: @asignacion_formulario.empleado_id
    fill_in "Empresa", with: @asignacion_formulario.empresa_id
    fill_in "Estado", with: @asignacion_formulario.estado
    fill_in "Seccion", with: @asignacion_formulario.seccion_id
    fill_in "Subseccion", with: @asignacion_formulario.subseccion_id
    fill_in "User created", with: @asignacion_formulario.user_created_id
    fill_in "User updated", with: @asignacion_formulario.user_updated_id
    fill_in "Usr grab", with: @asignacion_formulario.usr_grab
    fill_in "Usr modi", with: @asignacion_formulario.usr_modi
    click_on "Update Asignacion formulario"

    assert_text "Asignacion formulario was successfully updated"
    click_on "Back"
  end

  test "destroying a Asignacion formulario" do
    visit asignacion_formularios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Asignacion formulario was successfully destroyed"
  end
end
