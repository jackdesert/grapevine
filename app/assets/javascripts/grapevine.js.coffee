window.Grapevine =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Grapevine.Routers.Rumors()
    Backbone.history.start()
      


$(document).ready ->
  Grapevine.initialize()
