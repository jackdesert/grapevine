class Grapevine.Routers.Rumors extends Backbone.Router
  routes:
    '': 'index'
    'rumors/:id': 'show'

  initialize: ->
    @rumors_collection = new Grapevine.Collections.Rumors()
    @rumors_collection.comparator = false # no sorting for us, that way they stay in reverse chronological order
    @rumors_collection.fetch()

  index: ->
    view = new Grapevine.Views.RumorsIndex(collection: @rumors_collection)
    $('#rumor_headlines').html(view.render().el)

  show: (id) ->
    alert "Rumor #{id} Reached"
