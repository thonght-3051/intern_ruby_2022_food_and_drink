module AuthHelper
  def log_in user
    session[:user_id] = user.id
  end

  def decentralization_redirect_user user
    return redirect_to(admin_home_index_url) if user.admin?

    redirect_to root_url
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    session.delete :user_id
    @current_user = nil
  end
end
