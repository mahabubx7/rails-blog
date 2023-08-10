Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      post :auth, to: 'authentication#create'
      resources :users, only: [] do
        resources :posts, only: [:index] do
          resources :comments, only: [:index, :create]
        end
      end
    end
  end

  resources :users, only:[:index, :show] do
    resources :posts, only:[:index, :new, :show, :create, :destroy] do
      resources  :comments, only:[:index, :new, :create, :destroy]
      resources  :likes, only:[:new, :create]
    end
  end

  root "users#index"
end
