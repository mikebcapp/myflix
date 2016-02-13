Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  get "/home", to: "videos#index"
  
  resources :videos, only: :show do
    collection do
      get :search, to: "videos#search"
      get :recent, to: "videos#recent"
    end
  end

  resources :categories, only: :show
  
end
