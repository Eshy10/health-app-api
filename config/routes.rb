Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :measure_categories
      resources :measurements
    end
  end
end
