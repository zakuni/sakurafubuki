flutterDown = (sakuras) ->
  updatePosition(sakura) for sakura in sakuras
  requestAnimationFrame ->
    flutterDown(sakuras)

updatePosition = (sakura) ->
  offset = sakura.offset()
  if offset.top+1 > $(window).height() or offset.left-0.1 < 0
    top = 0
    left = Math.floor(Math.random()*$(window).width())
  else
    top = offset.top+1
    left = offset.left-0.1

  sakura.offset({top: top, left: left})

appendSakura = ->
  $('<div class="sakura">')
    .appendTo($('body'))
    .css(
      position: "relative",
      top: Math.floor(Math.random() * $(window).height()),
      left: Math.floor(Math.random() * $(window).width())
    )

$ ->
  sakuras = (appendSakura() for [1..10])
  requestAnimationFrame ->
    flutterDown(sakuras)