Rails.application.routes.draw do
  resources :jurors
  root 'home#index'

  resources :competitors
  resources :photos

  resources :contests do
    resources :nominations, shallow: true
    resources :criteria, shallow: true
    resources :jurors, shallow: true
    resources :contest_photos, path: 'photos', as: 'photos'
  end

  get 'jurors' => 'jurors#index', as: 'me_in_jury'

  devise_for :users
end
