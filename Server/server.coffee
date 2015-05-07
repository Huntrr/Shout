module.exports = () ->
  # IMPORTS
  express = require 'express'
  socketio = require 'socket.io'
  http = require 'http'
  SocketHandler = require './socket/socketHandler'
  
  # COMPONENTS
  app = express()
  server = http.Server app
  io = socketio server
  
  app.get '/', (req, res) ->
    res.send '... Yeah, this server doesn\'t really do GETs.'
  
  io.on 'connection', (socket) ->
    sock = new SocketHandler(socket)
  
  server.listen 3000, () ->
    console.log('Listening on *:3000')