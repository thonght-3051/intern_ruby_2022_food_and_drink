module AuthHelper
  def decentralization_redirect_user user
    return redirect_to(admin_home_index_url) if user.admin?

    redirect_to root_url
  end
end
