class GW.WalrusRouter extends Backbone.Router
  routes:
    '': 'index'

  index: ->
    new GW.AppView el: $('section#main')

new GW.WalrusRouter
Backbone.history.start( pushState: true )
