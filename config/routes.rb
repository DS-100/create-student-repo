Rails.application.routes.draw do
  resources :registrations
  root to: "registrations#new"

  resources :registrations, only: [:new, :create, :show]
end
