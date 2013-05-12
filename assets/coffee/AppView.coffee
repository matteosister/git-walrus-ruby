class GW.AppView extends Backbone.View
  initialize: ->
    @repo = new GW.RepositoryView
    @$el.append @repo.render().el
    @repo.loadTree()