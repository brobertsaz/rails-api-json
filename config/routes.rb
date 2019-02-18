Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sessions, :users, only: :create
      resource :demographics, only: :update
      resource :notifications, only: %i[create show]
    end
  end
end
