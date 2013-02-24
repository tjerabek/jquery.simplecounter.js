###
* Made by Tomáš Jeřábek, use it as you want.
* https://twitter.com/tjerabek (Say thanks, or follow me, if you want)
###

# Reference jQuery
$ = jQuery

$.fn.extend
  SimpleCounter: (options) ->
    # Default settings
    settings =
      buttonSelector: '.make-order'
      counterHeight: 0
      valSelector: '.val'
      move: 0
      debug: false

    # Merge default settings with options.
    settings = $.extend settings, options

    # Simple logger.
    log = (msg) ->
      console?.log msg if settings.debug

    increse = () ->
      $numbers = $ '.simple-counter-numbers'
      lastNumber = parseInt $numbers.find('.number').last().text()
      $newNumber = $ '<div class="number">' + (lastNumber + 1) + '</div>'
      $numbers.append $newNumber
      settings.move -= settings.counterHeight

      $numbers.css('-webkit-transform', 'translate3d(0, '+settings.move+'px, 0)')
      $numbers.css('-moz-transform', 'translate3d(0, '+settings.move+'px, 0)')
      $numbers.css('-ms-transform', 'translate3d(0, '+settings.move+'px, 0)')
      $numbers.css('-o-transform', 'translate3d(0, '+settings.move+'px, 0)')
      $numbers.css('transform', 'translate3d(0, '+settings.move+'px, 0)')
      $(settings.valSelector).text(lastNumber + 1) if settings.valSelector isnt ''
      return false

    return @each ()->
      $this = $(@)

      $this.wrapInner('<div class="number" />').wrapInner('<div class="simple-counter-numbers numbers" />');

      settings.counterHeight = $this.height()

      log "Item wrapped. Button class: #{settings.buttonSelector}, Button height: #{settings.counterHeight}."

      $('body').on 'click', settings.buttonSelector, increse if settings.buttonSelector isnt ''