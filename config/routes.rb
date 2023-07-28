Rails.application.routes.draw do
  root "welcome#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :search, only: [:index]
  resources :users, only: [:show]
end
