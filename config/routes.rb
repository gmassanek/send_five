SendFive::Application.routes.draw do

  root :to => 'pages#home'
  resources :gifts
  resources :users
  
  match "/learn_more" => "pages#learn_more"

  resources :sessions, :only => [:new, :create, :destroy]

  post "/pay_for_gift" => "gifts#pay_for_gift"

  get "send_to_paypal" => "gifts#send_to_paypal"

  match "receive_from_paypal" => "gifts#receive_from_paypal"

  match "paypal_listener" => "gifts#paypal_listener"
end
