
{ readFile } = require 'fs'
{ io }  = require './app'

sendContent = do ->
  previousContent = null
  contentFile = "/tmp/#{process.env.USER}-ttycast-content.txt"

  ->
    readFile contentFile, 'utf8', (err,content) ->
      content = "" if err
      if content != previousContent
        io.sockets.emit 'content-data', content
        previousContent = content

setInterval sendContent, 1000

