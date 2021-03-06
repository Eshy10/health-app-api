Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :measure_categories
      resources :measurements
    end
  end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  root 'api/v1/measure_categories#index'
end
