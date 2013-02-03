class Grapevine.Views.RumorsIndex extends Backbone.View

  template: JST['rumors/index']

  events:
    "click li" : "displayRumor"

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendRumor)
    this

  displayRumor: (event) ->
    id = event.currentTarget.id
    rumor = @collection.get(id)
    view = new Grapevine.Views.Rumor(model: rumor)
    $('#rumor_details').html(view.render().el)
    console.log('here')

  appendRumor: (rumor) ->
    view = new Grapevine.Views.RumorHeading(model: rumor)
    $('#rumors').append(view.render().el)
