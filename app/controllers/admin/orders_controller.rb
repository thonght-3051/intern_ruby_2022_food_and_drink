class Admin::OrdersController < ApplicationController
  before_action :find_order, only: %i(edit update)
  def index
    @pagy, @orders = pagy Order.all,
                          items: Settings.const.paginate
  end

  def edit; end

  def update
    if @order.update status_params
      OrderMailer.status(@order).deliver_now
      flash[:success] = t ".success"
      redirect_to admin_orders_path
    else
      flash[:danger] = t ".fail"
      render :edit
    end
  end

  private
  def status_params
    params.require(:order).permit(:status)
  end

  def find_order
    @order = find_object Order, params[:id]
  end
end
