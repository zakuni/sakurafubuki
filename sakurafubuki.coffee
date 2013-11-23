flutterDown = (sakuras) ->
  updatePosition(sakura) for sakura in sakuras
  requestAnimationFrame ->
    flutterDown(sakuras)

updatePosition = (sakura) ->
  offset = sakura.elem.offset()
  if offset.top+sakura.speedY > $(window).height() or offset.left-sakura.speedX < 0
    top = 0
    left = Math.floor(Math.random()*$(window).width())
  else
    top = offset.top+sakura.speedY
    left = offset.left-sakura.speedX

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
  sakuras = (appendSakura() for [1..10])
  requestAnimationFrame ->
    flutterDown(sakuras)