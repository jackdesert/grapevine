class Grapevine.Views.RumorNew extends Backbone.View

  template: JST['rumors/rumor_new']

  events:
    "click #new_rumor_submit" : "createRumor"

  render: ->
    $(@el).html(@template())
    this

  createRumor: (event) ->
    event.preventDefault()
    headline = $('#new_rumor_headline').val()
    body = $('#new_rumor_body').val()
    author = $('#new_rumor_author').val()
    # Note passing in a fake id that will be rewritten once back from the server
    # This allows the div to still have an id
    attributes = {headline: headline, body: body, author: author}
    @collection.create attributes
    @displayNewlyCreatedRumor(@collection.last())

  displayNewlyCreatedRumor: (rumor) ->
    # Similar to Grapevine.Views.RumorsIndex#displayRumor
    view = new Grapevine.Views.Rumor(model: rumor)
    $('#rumor_details').html(view.render().el)
