Rails.application.routes.draw do
  resources :parties
  resources :politicians
  resources :counties
  resources :coalitions
  resources :coalitions
  resources :bills
  devise_for :users
  root 'home#index'
end