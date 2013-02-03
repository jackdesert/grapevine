class Grapevine.Routers.Rumors extends Backbone.Router
  routes:
    '': 'index'
    'rumors/:id': 'show'

  index: ->
    view = new Grapevine.Views.RumorsIndex()
    $('#container').html(view.render().el)

  show: (id) ->
    alert "Rumor #{id} Reached"
