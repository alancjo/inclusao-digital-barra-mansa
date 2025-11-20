Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :mentors
  resources :supporters
  resources :students

  get "match", to: "matches#index"
  post "matches", to: "matches#create", as: :matches
  patch "matches/:id/accept", to: "matches#accept", as: :accept_match
  patch "matches/:id/reject", to: "matches#reject", as: :reject_match

  get "sobre", to: "pages#about", as: :about

  root to: "home#index"
end
