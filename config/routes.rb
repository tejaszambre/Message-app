Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#new'
  resources :users, only: [:new, :index, :create]
  get 'chatroom',to: 'chatroom#index'
  get 'login',to: 'sessions#new'
  post 'login',to: 'sessions#create'
  delete 'logout',to: 'sessions#destroy'
  post 'message',to: 'messages#create'
  mount ActionCable.server, at: '/cable'
end
