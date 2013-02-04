class Grapevine.Views.Rumor extends Backbone.View

  template: JST['rumors/rumor']

  events:
    "click #edit_rumor_button" : "editRumor"

  render: ->
    $(@el).html(@template(rumor: @model))
    this
      

  editRumor: (event) ->
    view = new Grapevine.Views.RumorForm({collection: @collection, rumor: @model, new_item: false})
    $('#rumor_details').html(view.render().el)
