flutterDown = (sakuras) ->
  updatePosition(sakura) for sakura in sakuras
  requestAnimationFrame ->
    flutterDown(sakuras)

updatePosition = (sakura) ->
  offset = sakura.elem.offset()
  nextX = offset.left - sakura.speedX
  nextY = offset.top + sakura.speedY
  if nextY > $(window).height() or nextX < 0
    top = 0
    left = Math.floor(Math.random()*$(window).width())
  else
    top = nextY
    left = nextX

  sakura.elem.offset({top: top, left: left})

appendSakura = ->
  sakura = 
    elem : $('<div class="sakura">')
      .appendTo $('body')
      .css
        position: "relative",
        top: Math.random() * $(window).height(),
        left: Math.random() * $(window).width()
    speedX : Math.random()
    speedY : Math.random()*2

$ ->
  sakuras = (appendSakura() for [1..20])
  requestAnimationFrame ->
    flutterDown(sakuras)