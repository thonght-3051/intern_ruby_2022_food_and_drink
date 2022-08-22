class ApplicationController < ActionController::Base
  include AuthHelper
  include Pagy::Backend
  protect_from_forgery with: :exception

  before_action :set_locale, :is_admin?

  def is_admin?
    return if logged_in? && current_user.role.admin?

    redirect_to root_url
  end

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def find_object model, id
    model.find(id)
  rescue StandardError
    template_not_found
  end

  def template_not_found
    respond_to do |format|
      format.html{render file: Rails.root.to_s << ("/public/404.html"), layout: false, status: :not_found}
      format.xml{head :not_found}
      format.any{head :not_found}
    end
  end
end
