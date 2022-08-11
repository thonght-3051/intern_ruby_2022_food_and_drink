class DashboardController < ApplicationController
  layout "dashboard"
  def index
    @pagy, @products = pagy Product.latest_product,
                            items: Settings.products.item_product
    @categories = Category.all
    @sizes = Size.all
    render "pages/products_landing"
  end
end
