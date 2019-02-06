Rails.application.routes.draw do

  resources :sessions, :users, only: :create
  resource :demographics, only: :update
  resource :notifications, only: %i[create show]

end
