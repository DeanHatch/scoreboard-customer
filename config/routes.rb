Rails.application.routes.draw do
  devise_for :admin
  devise_for :customer
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :admin, except: :destroy
  resource :customer, except: :destroy
  resource :organization, except: :destroy
  resource :credit, except: :destroy

  #root to: "application#index"
  root to: "customers#show"
end
