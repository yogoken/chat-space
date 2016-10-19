Rails.application.routes.draw do
  root 'chat_groups#index'
  devise_for :users
  resources :chat_groups, only: [:index, :new, :edit, :create, :update] do
    resources :messages, only: [:index, :create]
  end
  resources :users, only: :index
end
