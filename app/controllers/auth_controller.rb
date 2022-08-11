class AuthController < ApplicationController
  layout "auth"
  def new
    @user = User.new
    @address = @user.addresses.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to root_url
    else
      flash[:danger] = t "register_fail"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :name, :phone, :email, :password, :password_confirmation, addresses_attributes: [:name, :types]
    )
  end
end
