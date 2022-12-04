Rails.application.routes.draw do

  get 'comments/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'

  resources :home, only: [:index]
  resources :contact, only: [:index]
  resources :mountains, only: [:index, :new, :show] do
    collection do
      get 'search'
    end
    resources :comments, only: [:create]
  end
  resources :comments

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
