class Grapevine.Views.RumorHeading extends Backbone.View

  template: JST['rumors/rumor_heading']

  render: ->
    $(@el).html(@template(rumor: @model))
    this
