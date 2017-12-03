Rails.application.routes.draw do
  resources :posts
  get 'posts' => 'post#index', as: 'posts_path'
  get 'pages/index'

  root 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
