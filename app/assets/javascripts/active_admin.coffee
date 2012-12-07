#= require active_admin/base
#= require redactor

$ ->
  $('.redactor,#project_body').redactor({lang: 'pt_br', path: location.origin + '/assets'})
