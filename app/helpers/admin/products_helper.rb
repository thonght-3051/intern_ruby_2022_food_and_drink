module Admin::ProductsHelper
  def display_image product
    if product.product_images.present?
      product.product_images.first.image_url
    else
      image_url("images/product_image_default.jpg")
    end
  end

  def check_valid_date params, value
    if params.present?
      params[value].blank? ? "" : params[value].to_date
    else
      ""
    end
  end
end
