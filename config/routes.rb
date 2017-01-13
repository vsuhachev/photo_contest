Rails.application.routes.draw do
  root 'home#index'

  resources :competitors
  resources :photos

  resources :contests do
    resources :nominations, shallow: true
    resources :criteria, shallow: true
    resources :contest_photos, path: 'photos', as: 'photos'
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
