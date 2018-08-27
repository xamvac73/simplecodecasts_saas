Rails.application.routes.draw do
  resources :posts
  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :users do
    resource :profile
  end
  resources :contacts
  get '/about' => 'pages#about'
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
