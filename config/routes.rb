Rails.application.routes.draw do
  get 'foods_for_recipes/create_for_recipe'
  devise_for :users, path: 'accounts', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'secret',
    registration: 'signup'
  }

  get '/inventories/all_names_with_ids', to: 'inventories#all_names_with_ids'

  get '/public_recipes', to: 'recipes#public_recipes', as: 'public_recipes'

  resources :inventories do
    post 'add_selected_foods', on: :member
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
      get 'generate_shopping_list'
    end
  end

  get 'recipes/:id/show_recipe', to: 'recipes#show', as: 'show_recipe'
  resources :recipe_foods, only: [:destroy]
  delete '/recipe_foods/:id', to: 'recipe_foods#destroy', as: :delete_recipe_food
  get '/foods', to: 'foods#index'
  get '/foods/new', to: 'foods#new', as: 'new_food'
  get '/shopping_lists', to: 'shopping_lists#index'

  root to: "inventories#index"

end
