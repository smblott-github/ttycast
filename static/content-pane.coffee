
window.ContentPane = ContentPane =
  init: ->
    @el = document.getElementById('content-pane')

  handle: (message) ->
    if @el
      @el.style.color = "#222"
      setTimeout( (=>
        @el.textContent = message
        setTimeout( (=> @el.style.color = null), 200)
      ), 200)

window.showTerminal = do ->
  showingTerminal = false

  ->
    if not showingTerminal
      showingTerminal = true
      document.getElementById('message-container').style.visibility = 'hidden'
      document.getElementById('terminal-container').style.visibility = 'visible'

