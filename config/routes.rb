Rails.application.routes.draw do

  root "price_plans#index"

  resources :price_plans do
    resources :supply_nodes
    resources :telemetry_nodes
    resources :telemetry_channels
    resources :charges
  end

end
