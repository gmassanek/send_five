SendFive::Application.routes.draw do

  root :to => 'pages#home'
  resources :gifts
  resources :users
  
  match "/learn_more" => "pages#learn_more"
  
  resources :sessions, :only => [:new, :create, :destroy]

end
