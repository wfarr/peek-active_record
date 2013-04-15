$(document).on 'peek:update', ->
  arContext = $('#peek-context-active_record')
  if arContext.size()
    context = arContext.data('context')
    objects = context.object_count
    $('#active_record-tooltip').attr('title', "#{objects} AR Objects").tipsy()
