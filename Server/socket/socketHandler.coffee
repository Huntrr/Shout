module.exports = class SocketHandler
  constructor: (@socket) ->
    console.log 'New socket connection'
    
    @socket.on 'disconnect', () ->
      console.log 'Socket disconnected'
    