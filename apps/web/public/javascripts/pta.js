$(function() {
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
});
