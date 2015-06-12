$(function() {
  // 設定のプルダウンメニュー
  $("#config-menu").children("#button").on("click", function(event) {
    $(this).parent("#config-menu").children("#background").toggleClass("hide")
    $(this).parent("#config-menu").children("#content").toggleClass("hide")
  });

  $("#config-menu").children("#background").on("click", function(event) {
    $(this).toggleClass("hide")
    $(this).parent("#config-menu").children("#content").toggleClass("hide")
  });

  // ボタンをタップしたときのスタイル設定
  $('a, .button-transparent, .button-outline').on('touchstart touchend', function(event) {
    if ($(this).hasClass('button') == false) {
      if (event.type == 'touchstart') {
        $(this).addClass('tap');
      } else {
        $(this).removeClass('tap');
      }
    }
  });

  $('.button').on('touchstart touchend', function(event) {
    if (($(this).hasClass('button-transparent') == false)
        && ($(this).hasClass('button-outline') == false)) {
      if (event.type == 'touchstart') {
        $(this).addClass('bg-tap');
      } else {
        $(this).removeClass('bg-tap');
      }
    }
  });

  $('.button-transparent, .button-outline').on('touchstart touchend', function(event) {
    if (event.type == 'touchstart') {
      $(this).addClass('tap');
    } else {
      $(this).removeClass('tap');
    }
  });

  // textarea の自動拡大
  $("textarea").on("input click", function(event) {
    if(event.target.scrollHeight > event.target.offsetHeight) {
      $(event.target).height(event.target.scrollHeight);
    } else {
      var lineHeight = Number($(event.target).css("line-height").split("px")[0]);
      while (true) {
        $(event.target).height($(event.target).height() - lineHeight);
        if(event.target.scrollHeight > event.target.offsetHeight) {
          $(event.target).height(event.target.scrollHeight);
          break;
        }
      }
    }
  });
});
