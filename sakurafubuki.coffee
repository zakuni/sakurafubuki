flutterDown = () ->
  $(".sakura").each((index, elem)->
    offset = $(elem).offset()
    top = if offset.top+1 > $(window).height() then 0 else offset.top+1
    left = if offset.left-0.1 < 0 then $(window).width() else offset.left-0.1

    $(elem).offset({top: top, left: left})
  )
  requestAnimationFrame(flutterDown)

requestAnimationFrame(flutterDown)