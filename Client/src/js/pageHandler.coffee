$ = require './lib/jquery.js'

module.exports = class PageHandler
  constructor: (@pages...) ->
    if pages?
      @curPage = pages[1]

  load: (name) ->
    for page in @pages
      if page.name
        @curPage = page
    @refresh()
  
  refresh: (time = 0) ->
    @windowHeight = $(document).height()
    @windowWeight = $(document).width()
    alert 'REFRESH'