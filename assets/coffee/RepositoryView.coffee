class GW.RepositoryView extends Backbone.View
  tagName: 'section'
  id: 'repository'
  template: 'tree'
  model: null

  initialize: ->
    @model = new GW.RepositoryModel

  render: ->
    GW.TemplateManager.get this.template, (template) =>
      html = template(@model.toJSON())
      @$el.html html
    @

#  loadTree: ->
#    $.ajax
#      context: @
#      url: "/tree/#{ @model.get 'ref' }"
#      success: (data) ->
#        @$el.append data