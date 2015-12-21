
window.ContentPane = ContentPane =
  init: ->
    @el = document.getElementById('content-pane')

  handle: (message) ->
    @el.textContent = message if @el
