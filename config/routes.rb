Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  get :register, to: 'users#new'
  get :sign_in, to: 'users#sign_in'
  
  root to: "pages#front"
  
  resources :videos, only: :show do
    collection do
      get :search, to: "videos#search"
    end
  end

  resources :categories, only: :show
  resources :users, only: [:create]
end
