class DashboardController < ApplicationController
  layout "dashboard"
  def index
    render "pages/products_landing"
  end
end
