Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :parties
  resources :senators
  resources :mps
  resources :counties
  resources :coalitions
  resources :coalitions
  resources :bills do
    member do
      put "upvote", to: "bills#upvote"
      put "downvote", to: "bills#downvote"
    end
  end
  
  get 'about' => 'static#about', as: :about
  devise_for :users
  root 'home#index'
end