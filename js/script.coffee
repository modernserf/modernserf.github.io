"use strict"
# fix console.log errors
window.console ?= {}
window.console.log ?= ()->

$ ()->
  $window = $(window)
  $html = $('html')
  $body = $('body')
  $container = $('#article-container')
  $footer = $('.site-footer')

  $container.imagesLoaded ()->
    $container.masonry {
      itemSelector: 'article'
    }

    $window.on "resize", ()->
      # handle irregularities when rotating iPad, mostly
      $container.masonry()