Rails.application.routes.draw do
  devise_for :users
  root :to =>"homes#top"
  get 'homes/about'

  resources :groups, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
    get :search, on: :collection
    get "join" => "groups#join"
      delete "all_destroy" => "groups#all_destroy"
  end
  
  resources :group_users, only:[:update]

  resources :users, only: [:show, :edit, :update] 
  
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      get :search, on: :collection
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end