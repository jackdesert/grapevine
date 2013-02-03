class Grapevine.Views.RumorsIndex extends Backbone.View

  template: JST['rumors/index']

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendRumor)
    this

  appendRumor: (rumor) ->
    view = new Grapevine.Views.Rumor(model: rumor)
    $('#rumors').append(view.render().el)
