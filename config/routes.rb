SendFive::Application.routes.draw do

  root :to => 'pages#home'
  resources :gifts
  resources :users
  
  resources :sessions, :only => [:new, :create, :destroy]

end
