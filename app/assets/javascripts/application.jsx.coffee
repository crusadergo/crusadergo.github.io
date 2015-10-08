#= require modulejs
#= require jquery
#= require lib/new_post.js.jsx.coffee

modulejs.define 'application', ['lib/new_post'], (NewPost) ->
  run: ->
#    newPost = new NewPost
#    console.log newPost
#    ReactDOM.render newPost, document.getElementById('react-app')
    ReactDOM.render `<NewPost />`, document.getElementById('react-app')


app = modulejs.require 'application'

$(document).on 'ready page:load', ->
  app.run()