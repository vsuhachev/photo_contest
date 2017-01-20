Rails.application.routes.draw do
  scope path: 'contests', as: :public do
    get '' => 'public/contests#index', as: :contests
    scope path: ':contest_id', as: :contest do
      get 'about' => 'public/contests#about'
      get 'jurors' => 'public/contests#jurors'
      get 'competitors' => 'public/contests#competitors'
      get '' => 'public/nominations#index', as: :nominations
      scope path: ':nomination_id', as: :nomination do
        get '' => 'public/photos#index', as: :photos
        get ':photo_id' => 'public/photos#show', as: :photo
      end
    end
  end

  root 'home#index'

  concern :stateful do |options|
    member do
      post :transition, options
    end
  end

  resources :ratings, except: %i(new edit)

  scope path: 'admin' do
    resources :contests do
      concerns :stateful
      resources :nominations, shallow: true
      resources :criteria, shallow: true
      resources :jurors, shallow: true
      resources :competitors, shallow: true
      resources :photos, shallow: true
    end
  end

  devise_for :users
end
