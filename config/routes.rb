Rails.application.routes.draw do
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :customers, shallow: true  do
      resources :organizations
      resources :credits
    end

  root to: "application#index"
end
