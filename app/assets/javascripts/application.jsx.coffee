#= require modulejs
#= require jquery
#= require react
#= require react_ujs
#= require components
#= require lib/post_box

modulejs.define 'application', ['lib/post_box'], (PostBox) ->
  run: ->

    ReactDOM.render `<PostBox url = 'http://localhost:3000/' pollInterval={2000} />`, document.getElementById('posts')

app = modulejs.require 'application'

$(document).on 'ready page:load', ->
  app.run()