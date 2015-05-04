Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  root 'home#index'

  resources :settings do
    collection do 
      get :fetch_repo
    end
  end
  
end
