Rails.application.routes.draw do
  root 'home#index'

  concern :stateful do |options|
    member do
      post :transition, options
    end
  end

  resources :ratings, except: %i(new edit)

  resources :contests do
    concerns :stateful
    resources :nominations, shallow: true
    resources :criteria, shallow: true
    resources :jurors, shallow: true
    resources :competitors, shallow: true
    resources :photos, shallow: true
  end

  devise_for :users
end
