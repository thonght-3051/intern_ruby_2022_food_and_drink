$(document).ready(function () {
  var modal = $(document).find(".modal");

  $(document).on("click", ".btn-modal", function () {
    modal.show();
  });

  $(document).on("click", ".close", function () {
    modal.hide();
  });

  $(window).on("click", function (e) {
    if ($(e.target).is(".modal")) {
      modal.hide();
    }
  });
});
