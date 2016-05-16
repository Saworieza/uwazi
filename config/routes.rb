Rails.application.routes.draw do
  resources :parties
  resources :politicians
  resources :counties
  resources :coalitions
  resources :coalitions
  resources :bills do
    member do
      put "upvote", to: "bills#upvote"
      put "downvote", to: "bills#downvote"
    end
  end
  
  devise_for :users
  root 'home#index'
end