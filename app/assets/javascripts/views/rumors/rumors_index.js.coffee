class Grapevine.Views.RumorsIndex extends Backbone.View

  template: JST['rumors/index']

  render: ->
    $(@el).html(@template())
    this
