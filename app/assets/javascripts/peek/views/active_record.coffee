$(document).on 'peek:update', ->
  arContext = $('#peek-context-active-record')
  if arContext.size()
    context      = arContext.data('context')
    objects      = context.object_count
    object_types = context.object_types

    title = "<strong>#{objects} AR Objects</strong>"
    for key, val of object_types
      title += "<br>#{val} #{key}"

    $('#active_record-tooltip').attr('title', title).tipsy({html: true})
