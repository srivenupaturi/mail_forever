MailForever::Application.routes.draw do

  #static routes
  root to:'static_pages#home'

  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'

  #user routes
  match '/signup', to: 'users#new', via: 'get'

  resources :recipients
  resources :users do
    post 'login', on: :collection
  end
end
