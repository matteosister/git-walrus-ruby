class GW.RepositoryModel extends Backbone.Model
  defaults:
    ref: 'master'
    path: ''
    backUrl: '#'

  initialize: ->
    @set 'treeishCollection', new GW.TreeishCollection(@)

class GW.TreeishModel extends Backbone.Model

class GW.TreeishCollection extends Backbone.Collection
  model: GW.TreeishModel

  initialize: (repositoryModel) ->
    @url = "/tree/#{repositoryModel.get('ref')}#{repositoryModel.get('path')}"
    @fetch()