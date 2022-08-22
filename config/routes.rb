Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    get "dashboard", to: "dashboard#index"
    # Auth
    get "auth/register", to: "auth#new"
    get "auth/login"
    get "auth/logout"
    post "auth/create"
    post "auth/handle_login"

    # Admin
    namespace :admin do
      get "home/index"
      resources :categories
      resources :users
      resources :products
    end
  end
end
