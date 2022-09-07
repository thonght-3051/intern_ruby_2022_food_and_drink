class Admin::ProductsController < ApplicationController
<<<<<<< HEAD
  include AuthHelper
  before_action :find_product, except: %i(index new create)
  authorize_resource
=======
  # include AuthHelper
  # before_action :find_product, except: %i(index new create)
  load_and_authorize_resource
>>>>>>> Task devise
  def index
    param_filter = params[:q].reject{|_, v| v == "-1"} if params[:q].present?
    @q = Product.ransack(param_filter)
    respond_to do |f|
      f.html {
        @pagy, @products = pagy @q.result.includes(:category, :product_attributes),
                                items: Settings.const.paginate
      }
      f.json { render json: Category.all }
    end
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

  def show; end

  def edit; end

  def update
    if @product.update(product_params)
      flash[:success] = t ".alert_success_update"
      redirect_to admin_products_path
    else
      flash[:danger] = t ".alert_err_update"
      render :edit
    end
  end

  def destroy
    message, status = @product.destroy ? [t(".alert_success_destroy"), 200] : [t(".alert_err_destroy"), 404]
    render json: {message: message, status: status}
  end

  private
  def product_params
    params.require(:product).permit Product::PARAMS_PRODUCTS
  end

  def find_product
    @product = find_object Product, params[:id]
  end
end
