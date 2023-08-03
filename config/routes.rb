Rails.application.routes.draw do
  root "welcome#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :search, only: [:index]
  resources :users, only: [:show, :create] do
    resources :recipes, only: [:update]
  end
  resources :recipes, only: [:new, :show]

  post "/users/:user_id/recipes", to: "recipes#create"
  get "/recipes/:id/cook", to: "recipes#cook"
end
