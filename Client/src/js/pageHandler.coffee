$ = require './lib/jquery.js'

module.exports = class PageHandler
  constructor: (@pages...) ->
    if @pages?
      @curPage = @pages[0]
      if @pages.length > 1
        @curPage = @pages[1]

    that = @
    $(window).scroll () ->
      clearTimeout $.data(@, 'scrollTimer')
      $.data @, 'scrollTimer', setTimeout () ->
        val = $('body').scrollLeft() / that.windowWidth
        console.log val
        that.loadByNum Math.min(Math.max(0, Math.round(val)), that.pages.length)
        console.log 'STICKY SCROLL'
      , 250

  load: (name) ->
    for page in @pages
      if page.name
        @curPage = page
    @refresh()

  loadByNum: (id) ->
    @curPage = @pages[id]
    @refresh()
  
  refresh: (time = 0) ->
    @windowHeight = $(window).height()
    @windowWidth = $(window).width()

    $('#container').css('height', '' + @windowHeight + 'px')

    page.format(@windowWidth, @windowHeight) for page in @pages

    $('html,body').animate { scrollLeft: '' + @curPage.elem.position().left + 'px' }

    console.log 'Refreshed'
