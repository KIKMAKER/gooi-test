Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"

  resources :subscriptions do
    resources :collections, only: %i[new create]
    collection do
      get :tuesday
      get :wednesday
    end
  end
  resources :collections, only: :show

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
