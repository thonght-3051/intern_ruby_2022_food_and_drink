Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    resources :dashboard, only: %i(index show)
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
      resources :orders
    end
  end
end
