flutterDown = () ->
  offset = $("#sakura").offset()
  top = if offset.top+1 > $(window).height() then 0 else offset.top+1
  left = if offset.left-1 < 0 then $(window).width() else offset.left-1

  $("#sakura").offset({top: top, left: left})
  requestAnimationFrame(flutterDown)

requestAnimationFrame(flutterDown)