class Admin::ProductsController < ApplicationController
  def index
    @pagy, @products = pagy Product.latest_product,
                            items: Settings.const.paginate
  end
end
