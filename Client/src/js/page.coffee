$ = require './lib/jquery.js'

module.exports = class Page
  constructor: (@name, @elem) ->

  format: (@width, @height) ->
    @elem.css 'width', '' + @width + 'px'
    @elem.css 'height', '' + @height + 'px'
