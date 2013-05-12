class GW.RepositoryModel extends Backbone.Model
  defaults:
    ref: 'master'
    path: ''
    backUrl: '#'

class GW.RepositoryView extends Backbone.View
  tagName: 'section'
  id: 'repository'
  template: 'tree'
  model: new GW.RepositoryModel

  render: ->
    GW.TemplateManager.get this.template, (tmp) =>
      html = tmp(@model.toJSON())
      @$el.html html
    @

  initialize: ->
    @model = new GW.RepositoryModel

#  loadTree: ->
#    $.ajax
#      context: @
#      url: "/tree/#{ @model.get 'ref' }"
#      success: (data) ->
#        @$el.append data