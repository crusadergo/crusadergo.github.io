Rails.application.routes.draw do

  root 'posts#index'

  resources :posts

  post '/', to: 'posts#create'

end
