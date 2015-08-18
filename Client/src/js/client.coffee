config = require './config.coffee'
io = require './lib/socket-io.js'
$ = require './lib/jquery.js'
PageHandler = require './pageHandler.coffee'
Page = require './page.coffee'

class App
  constructor: () ->
    @bindEvents()
    
  bindEvents: () =>
    document.addEventListener 'deviceready', @onDeviceReady, false
  
  receivedEvent: (type) =>
    console.log 'Received Event: ' + type

    if type is 'deviceready'
      console.log 'Set up on ' + device.name + ' running ' + device.platform
      $ () ->
        console.log 'Loading page...'
        page_more = new Page('more', $('#page-more'))
        page_main = new Page('main', $('#page-main'))
        page_options = new Page('options', $('#page-options'))
        @ph = new PageHandler(page_more, page_main, page_options)
        console.log 'Page loaded'

        @ph.load 'main'

  onDeviceReady: () =>
    @receivedEvent 'deviceready'

app = new App()

console.log 'All loaded'
