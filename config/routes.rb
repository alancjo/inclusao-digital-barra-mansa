Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :mentors
  resources :supporters
  resources :students
  get "match", to: "matches#index"
  get "sobre", to: "pages#about", as: :about

  root to: "home#index"
end
