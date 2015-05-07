config = require './config.coffee'
io = require './lib/socket-io.js'
$ = require './lib/jquery.js'
PageHandler = require './pageHandler.coffee'

class App
  constructor: () ->
    @bindEvents()
    
  bindEvents: () ->
    document.addEventListener 'deviceready', @constructor.onDeviceReady, false
  
  onDeviceReady: () ->
    @constructor.receivedEvent 'deviceready'
  
  receivedEvent: (id) ->
    console.log 'Received Event: ' + id
    alert 'Up and running'

app = new App()

ph = new PageHandler()
