
{ readFile } = require 'fs'
{ io }  = require './app'

sendContent = do ->
  previousContent = null
  user = process.env.USER ? 'unknown'
  contentFile = process.env.EINSTEIN_CONTENT_FILE ? "/tmp/#{user}-ttycast-content.txt"
  console.log "listening for content in #{contentFile}"

  (sock = null) ->
    readFile contentFile, 'utf8', (err,content) ->
      content = "" if err
      if content != previousContent or sock
        (sock ? io.sockets).emit 'content-data', content
        previousContent = content

io.sockets.on 'connection', sendContent
setInterval sendContent, 1000

