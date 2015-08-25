Rails.application.routes.draw do
  
  root "rates/price_plans#index"
  
  namespace :rates do
    resources :price_plans
  end
  
end
