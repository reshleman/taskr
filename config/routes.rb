require "monban/constraints/signed_in"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do 
    root "dashboards#show", as: :dashboard
  end
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  root "homes#show"
end
