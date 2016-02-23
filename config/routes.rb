Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  get :home, to: 'videos#index'
  get :register, to: 'users#new'
  get :sign_in, to: 'sessions#new'
  get :sign_out, to: 'sessions#destroy'
  
  root to: "pages#front"
  
  resources :videos, only: :show do
    collection do
      get :search, to: "videos#search"
    end
  end

  resources :categories, only: :show
  resources :users, only: [:create]
  resources :sessions, only: [:create]
end
