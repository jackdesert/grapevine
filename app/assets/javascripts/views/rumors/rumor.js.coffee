class Grapevine.Views.Rumor extends Backbone.View

  template: JST['rumors/rumor']

  render: ->
    $(@el).html(@template(rumor: @model))
    this
