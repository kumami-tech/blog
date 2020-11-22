Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "posts#index"
  devise_for :users
  resources :posts do
    resources :comments, only: :create
  end
end
