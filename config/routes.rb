SendFive::Application.routes.draw do

  root :to => 'gifts#new'
  resources :gifts

end
