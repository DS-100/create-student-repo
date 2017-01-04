Rails.application.routes.draw do
  root to: "registrations#new"

  resources :registrations, only: [:new, :create, :show]
end
