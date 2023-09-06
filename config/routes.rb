Rails.application.routes.draw do
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
  root to: "inventories#index"
end
