Rails.application.routes.draw do
  default_url_options host: ENV.fetch('RAILS_HOST')

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount API => '/'
  
end
