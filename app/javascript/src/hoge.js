$(document).on('turbolinks:load', function () {
  $('.field').on('click.bs.dropdown.data-api', (event) => event.stopPropagation())
})