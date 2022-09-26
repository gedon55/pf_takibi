Rails.application.routes.draw do
  get 'favorites/index'
  devise_for :users
  root :to =>"homes#top"
  get 'homes/about'
  
  # ゲストログイン機能
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :groups, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
    get "join" => "groups#join"
      delete "all_destroy" => "groups#all_destroy"
  end
  
  resources :group_users, only:[:update]

  resources :users, only: [:show, :edit, :update] 
  
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy, :index]
  end
  
  resources :items, only: [:create, :index, :show, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end