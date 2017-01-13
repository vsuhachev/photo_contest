Rails.application.routes.draw do

  resources :competitors
  resources :contests do
    resources :nominations, shallow: true
    resources :criteria, shallow: true
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
