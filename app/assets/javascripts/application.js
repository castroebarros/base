// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require jquery.mask
//= require jquery_ujs
//= require jquery_nested_form
//= require moment
//= require fullcalendar
//= require fullcalendar/lang/pt
//= require bootstrap
//= require_tree .

jQuery(function() {
  $('.money').maskMoney({prefix: "", allowZero: true, allowNegative: false, thousands: ".", decimal: ",", affixesStay: false});
  $('.select2').select2({language: 'pt-BR'});

  $('.cpf').mask('000.000.000-00');
  $('.cep').mask('00.000-000');
  $('.cnpj').mask('00.000.000/0000-00');

  /* Configuração de máscara para 9 dígitos. */
  var SPMaskBehavior = function (val) {
    return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
  },
  spOptions = {
    onKeyPress: function(val, e, field, options) {
      field.mask(SPMaskBehavior.apply({}, arguments), options);
    }
  };
  $('.phone').mask(SPMaskBehavior, spOptions);
});
