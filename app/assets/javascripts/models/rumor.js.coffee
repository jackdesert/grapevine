class Grapevine.Models.Rumor extends Backbone.Model

  ensureMarkedAsRead: ->
    unless @get('already_read')
      @set('already_read', true)
      @save()
    div = $('li#' + @id)
    div.addClass('already_read')
    current = 'current_rumor'
    $('li').removeClass(current)
    div.addClass(current)
