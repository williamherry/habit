# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap-sprockets
#= require_tree .

$ ->
  $("#daily-tasks li input").on "change", (e) ->
    task_id = $(e.target).attr('data-id')
    action = if $(e.target).prop('checked') then "complete" else "uncomplete"
    $.ajax
      url: "/daily_tasks/#{task_id}/#{action}"
      type: "POST"
      dataType: "JSON"
