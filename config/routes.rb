Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v0 do
      resources :pings, only: [:index], constraints: { format: 'json' }
    end
  end
end
