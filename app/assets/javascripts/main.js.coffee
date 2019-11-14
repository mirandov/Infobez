$ ->

  $inputGroup = $('.datepicker').parent('.input-group')

  if !$inputGroup.hasClass 'date'
    $inputGroup.addClass 'date'

  $inputGroup.datepicker
    format: 'dd.mm.yyyy'
    weekStart: 1
    language: 'ru'
    autoclose: true
    todayHighlight: true
