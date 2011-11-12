SendFive::Application.routes.draw do

  root :to => 'gifts#new'
  resources :gifts
  resources :users
  
  resources :sessions, :only => [:new, :create, :destroy]

end
