Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  scope path: "contests", as: :public do
    get "" => "public/contests#index", :as => :contests
    scope path: ":contest_id", as: :contest do
      get "about" => "public/contests#show"
      get "ratings" => "public/ratings#index", :as => :ratings

      scope path: "jurors" do
        get "" => "public/jurors#index", :as => :jurors
        get ":id" => "public/jurors#show", :as => :juror
      end

      scope path: "competitors" do
        get "" => "public/competitors#index", :as => :competitors
        get ":id" => "public/competitors#show", :as => :competitor
      end

      get "" => "public/nominations#index", :as => :nominations

      scope path: ":nomination_id", as: :nomination do
        get "" => "public/photos#index", :as => :photos
        get "ratings" => "public/ratings#index"

        scope path: ":photo_id", as: :photo do
          get "" => "public/photos#show"
          get "ratings" => "public/ratings#show", :as => :ratings
        end
      end
    end
  end

  root "home#index"

  concern :stateful do |options|
    member do
      post :transition, options
    end
  end

  resources :ratings, except: %i[new edit]

  scope path: "admin" do
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

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
