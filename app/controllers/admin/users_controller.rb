class Admin::UsersController < ApplicationController
  def index
    @pagy, @users = pagy User.latest_user,
                         items: Settings.users.item_user
  end
end
