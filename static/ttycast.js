
/*global DisplayBuffer, ScreenBuffer, io*/
window.onload = function() {
  ContentPane.init()

  var el = document.getElementById('terminal')
    , buf = new DisplayBuffer(el)

  var socket = io.connect()
  socket.on('data', function(message) {
    if ('operations' in message) {
       if ( 0 < message.operations.length )
          showTerminal()
       ScreenBuffer.patch(buf, message.operations);
    }
    if ('content' in message)
       ContentPane.handle(message.content);
  })

}
