Rails.application.routes.draw do
  root 'home#index'

  resources :competitors
  resources :photos

  resources :contests do
    resources :nominations, shallow: true
    resources :criteria, shallow: true
    resources :jurors, shallow: true
    resources :contest_photos, path: 'photos', as: 'photos'
  end

  devise_for :users
end
