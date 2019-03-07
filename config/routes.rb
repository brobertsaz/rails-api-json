Rails.application.routes.draw do
  namespace :api do
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
      resources :members, only: %i[index show] do
        post :favorite, on: :member
      end
      resources :users, only: :create
    end
  end

  post 'user_token' => 'user_token#create'
end
