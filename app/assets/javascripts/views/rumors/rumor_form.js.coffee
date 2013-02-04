class Grapevine.Views.RumorForm extends Backbone.View

  template: JST['rumors/rumor_new']

  events:
    "click #new_rumor_submit" : "createRumor"
    "click #rumor_update"     : "updateRumor"
    "click #new_rumor_cancel" : "cancelForm"

  render: ->
    parameters = {new_item: @options.new_item, rumor: @options.rumor}
    $(@el).html(@template(parameters))
    this

  createRumor: (event) ->
    event.preventDefault()
    attributes = @getFormAttributes()
    @collection.create attributes
    @displayNewlyCreatedRumor(@collection.last())

  updateRumor: (event) ->
    event.preventDefault()
    attributes = @getFormAttributes()
    # For some reason we don't have access to @collection here
    collection = @.options.rumor.collection
    rumor = collection.get(@options.rumor.id)
    rumor.set(attributes)
    rumor.save()
    @displayNewlyCreatedRumor(rumor)

  cancelForm: (event) ->
    event.preventDefault()
    window.vv = @
    rumor = @.options.rumor
    if rumor
      @displayNewlyCreatedRumor(rumor)
    else
      $('#rumor_details').html('')


  displayNewlyCreatedRumor: (rumor) ->
    # Similar to Grapevine.Views.RumorsIndex#displayRumor
    view = new Grapevine.Views.Rumor(model: rumor)
    $('#rumor_details').html(view.render().el)

  getFormAttributes: ->
    headline = $('#new_rumor_headline').val()
    body = $('#new_rumor_body').val()
    author = $('#new_rumor_author').val()
    attributes = {headline: headline, body: body, author: author}
    return attributes

