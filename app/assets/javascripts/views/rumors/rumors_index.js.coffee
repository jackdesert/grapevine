class Grapevine.Views.RumorsIndex extends Backbone.View

  template: JST['rumors/index']

  tagName: 'None'

  events:
    "click li"                : "displayRumorFromEvent"
    "click #new_rumor_button" : "buildRumor"

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('error', @resetAfterSeed, this)
    @collection.on('add', @prependRumorAndMarkAsCurrent, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendRumor)
    #@buildRumor() # take this out later
    @setHeightOfIndex()
    this

  resetAfterSeed: ->
    # Call this if an update to the server fails
    # (We are expecting an update to fail if someone leaves Grapevine open in their 
    # browser overnight (meanwhile database is re-seeded) then tries to edit a rumor
    # that isn't in the database anymore (server will return a 404 error
    xhr = arguments[1]
    if xhr.status == 404
      @collection.fetch()
      $('#rumor_details').html('<--Click left')
      alert 'Now refreshing to grab new content. (Re-seeded every midnight)'

  displayRumorFromEvent: (event) ->
    id = event.currentTarget.id
    rumor = @collection.get(id)
    rumor.ensureMarkedAsRead()
    @displayRumor(rumor)


  displayRumor: (rumor) ->
    # Similar to Grapevine.Views.RumorForm#displayNewlyCreatedRumor
    view = new Grapevine.Views.Rumor(model: rumor)
    $('#rumor_details').html(view.render().el)
      
  appendRumor: (rumor) ->
    view = new Grapevine.Views.RumorHeadline(model: rumor)
    $('#rumors').append(view.render().el)

  prependRumorAndMarkAsCurrent: (rumor) ->
    @displayRumor(@collection.first())
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

