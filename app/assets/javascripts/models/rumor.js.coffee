class Grapevine.Models.Rumor extends Backbone.Model

  ensureMarkedAsRead: ->
    unless @get('already_read')
      @set('already_read', true)
      @save()
    @markAsCurrent()

  markAsCurrent: ->
    div_id = @id || @defaultId
    div = $('li#' + div_id)
    div.addClass('already_read')
    current = 'current_rumor'
    $('li').removeClass(current)
    div.addClass(current)

  # defaultId is used until the model hits the server, so the 
  # jquery selector can find it. 
  # (Referenced in this file and in 
  # templates/rumors/rumor_headline.jst.eco)
  defaultId: 1e12
