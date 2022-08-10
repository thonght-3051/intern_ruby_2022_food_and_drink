Rails.application.routes.draw do
  get 'auth/register'
  get 'auth/login'
  get 'auth/logout'
  namespace :admin do
    get 'home/index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
