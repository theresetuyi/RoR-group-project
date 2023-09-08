Rails.application.routes.draw do
  get 'foods_for_recipes/create_for_recipe'
  devise_for :users, path: 'accounts', path_names: {
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

  resources :foods, only: [:create]
  resources :recipes, except: [:show]

  resources :foods_for_recipes, only: [:create] do
    collection do
      post 'create_for_recipe'
    end
  end

  resources :recipes do
    member do
      patch 'update_status'
      get 'add_food' # Route for adding food to a recipe
      post 'create_food' # Route for creating food and adding it to the recipe
      get 'select_foods'
      post 'add_selected_foods'
    end
  end

  get 'recipes/:id/show_recipe', to: 'recipes#show', as: 'show_recipe'

  get '/foods', to: 'foods#index'
  get '/foods/new', to: 'foods#new', as: 'new_food'
  get '/shopping_lists', to: 'shopping_lists#index'

  root to: "inventories#index"
end
