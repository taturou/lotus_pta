$(function() {
  // 設定のプルダウンメニュー
  $('#config-menu').children('#button').on('click', function(event) {
    $(this).parent('#config-menu').children('#background').toggleClass('hide')
    $(this).parent('#config-menu').children('#content').toggleClass('hide')
  });

  $('#config-menu').children('#background').on('click', function(event) {
    $(this).toggleClass('hide')
    $(this).parent('#config-menu').children('#content').toggleClass('hide')
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
  $('textarea').on('input click', function(event) {
    if(event.target.scrollHeight > event.target.offsetHeight) {
      $(event.target).height(event.target.scrollHeight);
    } else {
      var lineHeight = Number($(event.target).css('line-height').split('px')[0]);
      while (true) {
        $(event.target).height($(event.target).height() - lineHeight);
        if(event.target.scrollHeight > event.target.offsetHeight) {
          $(event.target).height(event.target.scrollHeight);
          break;
        }
      }
    }
  });

  // alert
  $('#alert').on('click', function(event) {
    // ダイアログに表示するデータを取得
    var data = {};
    $(this).children('input').forEach(function(item, index, array) {
      data[item.name] = item.value;
    });

    // 元のコンテンツを固定する
    var org_overflow = $('html').css('overflow');
    var org_height = $('html').css('height');
    $('html').css('overflow', 'hidden');
    $('html').css('height', '100%');

    // バックグラウンドを作成
    $('body').append('<div id="alert_background" class="fixed top-0 right-0 bottom-0 left-0 z4 bg-white muted"></div>');
    var background = $('body').children('#alert_background');

    // ダイアログを作成
    $('body').append('\
        <div id="alert_dialog" class="fixed top-0 right-0 bottom-0 left-0 z4 bg-white mt4 mb4 ml2 mr2 border rounded">\
        </div>\
        ');

    // バックグラウンドをクリックしたら全てを削除する
    background.on('click', function(event) {
      $('body').children('#alert_background').on('click', function(event) {
        $(this).remove();
        $('body').children('#alert_dialog').remove();
        $('html').css('overflow', org_overflow);
        $('html').css('height', org_height);
      });
    });
  });
});
