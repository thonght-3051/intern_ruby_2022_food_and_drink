class DashboardController < ApplicationController
  layout "dashboard"
  def index
    @pagy, @products = pagy Product.latest_product,
                            items: Settings.products.item_product
    @categories = Category.all
    @sizes = Size.all
    render "pages/products_landing"
  end

  def show
    @product = Product.find(params[:id])
    return render "pages/show" if @product

    flash[:danger] = t ".not_found"
    redirect_to dashboard_path
  end
end
