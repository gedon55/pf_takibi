Rails.application.routes.draw do
  devise_for :users
  root :to =>"homes#top"
  get 'homes/about'
  
  resources :groups, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
    get "join" => "groups#join"
  end
  
  resources :users, only: [:show, :edit, :update] 
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      get :search, on: :collection
  end
     
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end