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

  $(document).on("click", ".btn-delete-product", function (e) {
    let id = $(this).data("id");
    let name = $(this).data("name");
    Swal.fire({
      title: I18n.t("admin.products.destroy.title_modal", name),
      icon: "question",
      iconHtml: "؟",
      confirmButtonText: I18n.t("btn_ok"),
      cancelButtonText: I18n.t("btn_cancel"),
      showCancelButton: true,
      preConfirm: (function (e) {
        $.ajax({
          type: "DELETE",
          url: `products/${id}`,
        }).done(results => {
          localStorage.setItem("flash", I18n.t("admin.products.destroy.alert_success_destroy"))
          window.location.reload();
        }).fail(errors => {
          toastr.error(I18n.t("admin.products.destroy.alert_err_destroy"))
        })
      })
    })
  })
  $(window).bind('load', function () {
    if (localStorage.getItem("flash") != null) {
      toastr.success(localStorage.getItem("flash"))
      localStorage.removeItem("flash")
    }
  })
})
