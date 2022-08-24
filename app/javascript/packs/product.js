$(document).ready(function () {
  let attrClass = $(document).find(".nested-attr-fields");
  let imageClass = $(document).find(".nested-image-fields");
  if (attrClass.length == 1) {
    $(".remove-attr").addClass("d-none")
  }

  if (imageClass.length == 1) {
    $(".remove-image").addClass("d-none")
  }

  $(".btn-add-attr").click(function (e) {
    $(".remove-attr").removeClass("d-none")
  })
  $(".btn-add-image").click(function (e) {
    $(".remove-image").removeClass("d-none")
  })

  $("#new_product").bind("DOMSubtreeModified", function () {
    if ($(this).find(".nested-fields").length == 1) {
      $(".remove-attr").addClass("d-none")
    }
  })
})
