Rails.application.routes.draw do
  # resources :recipe_foods

  devise_for :users, path: 'auth', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'secret',
    registration: 'signup'
  }
  
  resources :inventories do
    resources :foods do
      resources :inventory_foods
    end
  end
  get '/foods', to: 'foods#index'
  get '/shopping_lists', to: 'shopping_lists#index'
  resources :recipes
  root to: "inventories#index"
end
