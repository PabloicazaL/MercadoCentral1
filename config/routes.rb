Rails.application.routes.draw do
  

  root 'pages#home'

  devise_for :users,  #Para esconder y cambiar los URL
  			 :path => '',
  			 :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
  			 :controllers => {:omniauth_callbacks  => 'omniauth_callbacks', 
  			 				  :registrations => 'registrations',
  			 				 }

  resources :users, only: [:show]  #Path only for users

  resources :comidas
  resources :photos

  resources :comidas do
    resources :pedidos, only: [:create]
  end

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  resources :comida do
    resources :reviews, only: [:create, :destroy]
  end

  get '/preload' => 'pedidos#preload'
  get '/tus_pedidos' => 'pedidos#tus_pedidos'
  get '/tus_ventas' => 'pedidos#tus_ventas'

  get '/search' => 'pages#search'
  get '/pago' => 'pedidos#pago'

end