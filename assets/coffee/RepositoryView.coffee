class GW.RepositoryModel extends Backbone.Model
  defaults:
    ref: 'master'
    path: ''
    backUrl: '#'

class GW.RepositoryView extends Backbone.View
  tagName: 'section'
  id: 'repository'

  initialize: ->
    @model = new GW.RepositoryModel

  loadTree: ->
    $.ajax
      context: @
      url: "/tree/#{ @model.get 'ref' }"
      success: (data) ->
        @$el.append data