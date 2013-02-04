class Grapevine.Views.RumorsIndex extends Backbone.View

  template: JST['rumors/index']

  tagName: 'None'

  events:
    "click li"                : "displayRumor"
    "click #new_rumor_button" : "buildRumor"

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @prependRumorAndMarkAsCurrent, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendRumor)
    #@buildRumor() # take this out later
    @setHeightOfIndex()
    this

  displayRumor: (event) ->
    # Similar to Grapevine.Views.RumorForm#displayNewlyCreatedRumor
    id = event.currentTarget.id
    rumor = @collection.get(id)
    rumor.ensureMarkedAsRead()
    view = new Grapevine.Views.Rumor(model: rumor)
    $('#rumor_details').html(view.render().el)

  appendRumor: (rumor) ->
    view = new Grapevine.Views.RumorHeadline(model: rumor)
    $('#rumors').append(view.render().el)

  prependRumorAndMarkAsCurrent: (rumor) ->
    view = new Grapevine.Views.RumorHeadline(model: rumor)
    $('#rumors').prepend(view.render().el)
    rumor.markAsCurrent()
    @setHeightOfIndex()

  setHeightOfIndex: ->
    extra = 100
    current = $('#content').height()
    height = extra + $('#rumor_headlines').height()
    min = 500
    height = Math.max(height, min)
    $('#content').height(height)

  buildRumor: (event) ->
    view = new Grapevine.Views.RumorForm(collection: @collection, new_item: true)
    $('#rumor_details').html(view.render().el)
    $('#new_rumor_headline').focus()

