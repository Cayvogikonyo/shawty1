Rails.application.routes.draw do
mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  resources :articles
  resources :pins
  resources :users
  resources :user_sessions, only: [ :new, :create, :destroy ]
  get 'login' => 'user_sessions#new'
  get 'logout' => 'user_sessions#destroy'
end