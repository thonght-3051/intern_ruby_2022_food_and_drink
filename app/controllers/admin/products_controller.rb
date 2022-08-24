class Admin::ProductsController < ApplicationController
  def index
    @pagy, @products = pagy Product.latest_product,
                            items: Settings.const.paginate
  end

  def new
    @product = Product.new
    @product_attributes = @product.product_attributes.build
    @product_images = @product.product_images.build
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t ".success"
      redirect_to admin_products_path
    else
      flash.now[:danger] = t ".fail"
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit Product::PARAMS_PRODUCTS
  end
end
