// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap
//= require jquery_ujs
//= require jquery.purr
//= require dataTables/jquery.dataTables
//= require bootstrap-datepicker
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js
//= require turbolinks
//= require_tree .
//= require best_in_place



function showhide(id) {
  var e = document.getElementById(id);
  e.style.display = (e.style.display == 'block') ? 'none' : 'block';
}

jQuery(document).ready(
  function($){
    $('.best_in_place').best_in_place();
  })

$('[data-behaviour~=datepicker]').datepicker({
    format: "dd/mm/yyyy",
    language: "es"
});

// jQuery(document).ready(function($) {
    $('#pacientes_table').dataTable( {
        "columns": [
          { "orderData": [ 0, 1 ,1,1] },
          { "orderData": 0, },
          { "orderData": [ 2, 3, 4 ] },
          { "orderData": [ 2, 3, 4 ] },
          null,
          null,
          null,
          null,
          null
        ],
        "language": {
            "lengthMenu": "Mostrando _MENU_ registros por pagina",
            "zeroRecords": "No existen registros",
            "info": "Mostrando pagina _PAGE_ de _PAGES_",
            "infoEmpty": "No hay registros disponibles"
          }
      } );
// } );
