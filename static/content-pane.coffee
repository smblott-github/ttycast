
window.ContentPane = ContentPane =
  init: ->
    @el = document.getElementById('content-pane')

  handle: (message) ->
    return unless @el
    @el.textContent = message

window.onload = -> ContentPane.init()
