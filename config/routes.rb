Rails.application.routes.draw do
  resources :constituencies
  resources :contests
  resources :politicians
  mount Ckeditor::Engine => '/ckeditor'
  resources :parties
  resources :persons
  resources :counties
  resources :coalitions
  resources :coalitions
  resources :comments do
    member do
      put "upvote", to: "comments#upvote"
      put "downvote", to: "comments#downvote"
    end
  end
  
  resources :bills do
    member do
      put "upvote", to: "bills#upvote"
      put "downvote", to: "bills#downvote"
    end
  end
  
  get 'about' => 'static#about', as: :about
  get 'privacy' => 'static#privacyandlegal', as: :privacy
  devise_for :users
  root 'home#index'
end