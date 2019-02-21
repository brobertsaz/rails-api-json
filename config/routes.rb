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
    end
  end

  post 'refresh', controller: :refresh, action: :create
  post 'signin', controller: :signin, action: :create
  post 'signup', controller: :signup, action: :create
  delete 'signin', controller: :signin, action: :destroy
end
