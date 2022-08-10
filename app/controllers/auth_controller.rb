class AuthController < ApplicationController
  def register
    @user = User.new
  end

  def login
    @user = User.new register_params
    if @user.save
      flash[:info] = "success"
      redirect_to root_url
    else
      flash[:danger] = "sign_up_failed"
      render :new
    end
  end

  def logout
  end

  private
  def register_params
    params.required(:user).permit(
      :name, :phone, :email, :password, :password_confirmation
    )    
  end
end
