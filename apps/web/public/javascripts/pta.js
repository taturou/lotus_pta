$(function() {
  // フォームで DELETE、PUT、PATCH を送信する
  $('form').submit(function(event) {
    event.preventDefault();

    var $form = $(this);
    var $button = $form.find('button');
    var $redirect_url = $form.attr('redirect_url');
    if ($redirect_url == null) {
      $redirect_url = $form.attr('action');
    }

    $.ajax({
      url: $form.attr('action'),
      type: $form.attr('method'),
      data: $form.serialize(),
      timeout: 10000,   // milli sec

      beforeSend: function(xhr, settings) {
          $button.attr('disabled', true);
      },
      success: function(data, status, xhr) {
      },
      error: function(xhr, errorType, error) {
      },
      complete: function(xhr, status) {
          $button.removeAttr('disabled');
          location = $redirect_url;
      },
    });
  });

  // textarea の自動拡大
  $("textarea").on("input", function(event) {
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

  $("textarea").on("click", function(event) {
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
