Rails.application.routes.draw do

  devise_for :users
  root :to =>"homes#top"

  # ゲストログイン機能
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :groups, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
    get "join" => "groups#join"
      delete "all_destroy" => "groups#all_destroy"
  end

  resources :group_users, only:[:update]

  resources :users, only: [:show, :update]

  get "favorites" => "favorites#index"
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
  end

  resources :items, only: [:create, :index, :show, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end