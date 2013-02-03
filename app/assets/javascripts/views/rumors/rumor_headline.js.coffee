class Grapevine.Views.RumorHeadline extends Backbone.View

  template: JST['rumors/rumor_headline']

  render: ->
    $(@el).html(@template(rumor: @model))
    this
