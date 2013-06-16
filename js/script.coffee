"use strict"
# fix console.log errors
window.console ?= {}
window.console.log ?= ()->

$ ()->
  $window = $(window)
  $html = $('html')
  $body = $('body')
  $articles = $('article')

  # set width to initial page size, in ems
  do lock_window_size = ()->
    window_in_rems = Math.floor( $window.width() / 16 )
    $html.css { "width": "#{window_in_rems}em" }

  $window.on "resize", lock_window_size

  zoom_to = (el)->
    $articles.removeClass('zoomed')
    el.addClass('zoomed')
    $html.addClass('article-zoom')
    offset = el.offset()
    $('body').animate({"scrollTop" : offset.top, "scrollLeft" : offset.left }, 1000 )

  $articles.on 'click', ()->
    zoom_to $(this)

  $('#home-link').on 'click', ()->
    $html.removeClass('article-zoom')
    $body.animate({"scrollTop": 0 , "scrollLeft": 0 }, 1000)

  $('#contact-link').on 'click', ()->
    zoom_to $('#contact')

  $('#prev-item').on 'click', ()->
    zoom_to $articles.eq( $('.zoomed').index() - 1)

  $('#next-item').on 'click', ()->
    zoom_to $articles.eq( $('.zoomed').index() + 1)