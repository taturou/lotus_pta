$(function() {
  // textarea ‚Ì©“®Šg‘å
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
