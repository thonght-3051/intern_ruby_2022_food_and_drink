Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    namespace :admin do
      get 'home/index'
    end

    get "dashboard", to: "dashboard#index"
    # Auth
    get "auth/register", to: "auth#new"
    get "auth/login"
    get "auth/logout"
    post "auth/create"
    post "auth/handle_login"
  end
end
