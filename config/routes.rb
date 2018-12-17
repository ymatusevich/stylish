Stylish::Engine.routes.draw do
  resources :images
  resources :styles do
    get :enable, on: :collection
  end

  root to: 'application#index'
end
