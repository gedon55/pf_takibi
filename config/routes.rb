Rails.application.routes.draw do

  root :to =>"homes#top"
  get 'homes/about'
  devise_for :users

  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
     get :search, on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end