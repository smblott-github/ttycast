
timeoutSet = (ms,f) -> setTimeout f, ms

previousOnload = window.onload
window.onload = ->
  socket = previousOnload()

  socket.on 'terminal-data', do ->
    done = false
    (operations) ->
      if not done and 0 < operations.length
        done = true
        document.getElementById('terminal-container').style.visibility = 'visible'
        document.getElementById('message-container').style.visibility = 'hidden'

  socket.on 'content-data', do ->
    el = document.getElementById 'content-pane'
    color = el.style.color
    (data) ->
      # We use a mini tween-like effect by changing the font color.
      el.style.color = '#333'
      timeoutSet 200, ->
        el.textContent = data
        timeoutSet 200, ->
          el.style.color = color
