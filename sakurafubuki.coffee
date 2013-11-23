flutterDown = () ->
  $(".sakura").each((index, elem)->
    offset = $(elem).offset()
    top = if offset.top+1 > $(window).height() then 0 else offset.top+1
    left = if offset.left-0.1 < 0 then Math.floor(Math.random()*$(window).width()) else offset.left-0.1

    $(elem).offset({top: top, left: left})
  )
  requestAnimationFrame(flutterDown)

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