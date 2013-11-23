flutterDown = () ->
  $(".sakura").each((index, elem)->
    updatePosition(elem)
  )
  requestAnimationFrame(flutterDown)

updatePosition = (elem) ->
  offset = $(elem).offset()
  if offset.top+1 > $(window).height() or offset.left-0.1 < 0
    top = 0
    left = Math.floor(Math.random()*$(window).width())
  else
    top = offset.top+1
    left = offset.left-0.1

  $(elem).offset({top: top, left: left})

appendSakura = () ->
  $('<div class="sakura">')
    .appendTo($('body'))
    .css(
      position: "relative",
      top: Math.floor(Math.random() * $(window).height()),
      left: Math.floor(Math.random() * $(window).width())
    )

$ ->
  appendSakura() for [1..10]
  requestAnimationFrame(flutterDown)