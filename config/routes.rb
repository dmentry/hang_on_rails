Rails.application.routes.draw do
  root to: 'games#index'

  resources :games, only: [:create, :show, :index] do
    post :play, on: :member
  end
end
