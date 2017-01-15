Rails.application.routes.draw do
  root 'home#index'

  resources :competitors
  resources :photos

  concern :stateful do |options|
    member do
      post :transition, options
    end
  end

  resources :contests do
    concerns :stateful
    resources :nominations, shallow: true
    resources :criteria, shallow: true
    resources :jurors, shallow: true
    resources :contest_photos, path: 'photos', as: 'photos'
  end

  devise_for :users
end
