(function() {
  var appendSakura, flutterDown, updatePosition;

  flutterDown = function(sakuras) {
    var sakura, _i, _len;
    for (_i = 0, _len = sakuras.length; _i < _len; _i++) {
      sakura = sakuras[_i];
      updatePosition(sakura);
    }
    return requestAnimationFrame(function() {
      return flutterDown(sakuras);
    });
  };

  updatePosition = function(sakura) {
    var left, nextX, nextY, offset, top;
    offset = sakura.elem.offset();
    nextX = offset.left - sakura.speedX;
    nextY = offset.top + sakura.speedY;
    if (nextY > $(window).height() || nextX < 0) {
      top = 0;
      left = Math.floor(Math.random() * $(window).width());
    } else {
      top = nextY;
      left = nextX;
    }
    return sakura.elem.offset({
      top: top,
      left: left
    });
  };

  appendSakura = function() {
    var sakura;
    return sakura = {
      speedX: Math.random(),
      speedY: Math.random() * 2,
      elem: $('<div class="sakura">').width(Math.random() * 10 + 15).height(Math.random() * 5 + 15).css({
        position: "absolute",
        top: Math.random() * $(window).height(),
        left: Math.random() * $(window).width()
      }).appendTo($('body'))
    };
  };

  $(function() {
    var sakuras;
    sakuras = (function() {
      var _i, _results;
      _results = [];
      for (_i = 1; _i <= 20; _i++) {
        _results.push(appendSakura());
      }
      return _results;
    })();
    return requestAnimationFrame(function() {
      return flutterDown(sakuras);
    });
  });

}).call(this);

/*
//# sourceMappingURL=sakurafubuki.js.map
*/
