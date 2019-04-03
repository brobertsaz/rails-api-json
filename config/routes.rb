Rails.application.routes.draw do

  namespace :api do
    post '/graphql', to: 'graphql#execute'

    if Rails.env.development?
      mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: 'graphql#execute'
    end

    namespace :v1 do
      resources :sessions, :users, only: :create
      resource :demographics, only: :update
      resource :notifications, only: %i[create show]

      resources :bills, only: %i[index show] do
        post :favorite, on: :member
        get :cosponsors, on: :member
        resources :votes, only: :show
        resource :position, only: %i[create destroy]
      end

      resources :committees, only: :show
      resource :dashboard, only: :show
      resource :my_scope, only: :show

      resources :members, only: %i[index show] do
        post :favorite, on: :member
      end

      resources :posts, only: %i[index show] do
        post :favorite, on: :member
        post :share, on: :member
        resources :votes, only: :show
        resource :post_position, only: %i[create destroy]
      end

      resources :users, only: :create
    end
  end

  post 'user_token' => 'user_token#create'
end
