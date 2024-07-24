document.addEventListener('DOMContentLoaded', () => {
  document.querySelector('#add_asignacion').addEventListener('click', (e) => {
    e.preventDefault();
    let time = new Date().getTime();
    let template = document.querySelector('#new_asignacion_template').innerHTML;
    let new_fields = template.replace(/NEW_RECORD/g, time);
    document.querySelector('#asignacion_formularios').insertAdjacentHTML('beforeend', new_fields);
  });

  document.querySelector('#asignacion_formularios').addEventListener('click', (e) => {
    if (e.target.classList.contains('remove_fields')) {
      e.preventDefault();
      e.target.closest('.nested-fields').remove();
    }
  });
});
