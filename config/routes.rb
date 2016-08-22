Rails.application.routes.draw do
  resources :profiles
  get 'profile/create/:id', to: 'profiles#new'
  get '/:id', to: 'posts#destroy'
  get 'commenters/create'
  get ':id/commenters', to: 'commenters#create'
  get 'users/show'
  get 'users/add_user'
  get 'profiles/add_user'
  get 'users/reject_user/:id', to: 'users#reject_user'
  get 'users/acceptuser'
  get 'users/friend'
  get 'users/profile'
  get ':controller/:action/:id'
  patch 'users/updateprofile/:id', to: 'users#updateprofile'
  put 'post/like/:id', to: 'posts#like'
  put 'post/unlike/:id', to: 'posts#unlike'
  get 'post/like/:id', to: 'posts#like'
  get 'post/unlike/:id', to: 'posts#unlike'
  get 'post/new', to: 'posts#new'
  get 'users/friend/:id', to: 'users#unfriend'



  devise_for :users

  resources :posts , :path => '/' do
     put 'like', to: 'posts#like'
     put "unlike", to: "posts#unlike"
    resources :commenters
  end
  resource :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
