$(document).on 'peek:render', (event, request_id, data) ->
  object_count = data.context['active-record'].object_count
  object_types = data.context['active-record'].object_types

  title = "<strong>#{object_count} AR Objects</strong>"
  for key, val of object_types
    title += "<br>#{val} #{key}"

  $('#active_record-tooltip').attr('title', title).tipsy
    html: true
    gravity: $.fn.tipsy.autoNS
