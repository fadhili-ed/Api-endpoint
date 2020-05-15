# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  # devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    # namespace :v0 do
    #   resources :pings, only: [:index], constraints: { format: 'json' }
    # end
    namespace :v1, default: { format: :json } do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :todo, only: [:index, :update]
    end
  end
end
