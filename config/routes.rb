Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :users
  root to: 'homes#top'#どこに飛ばすのかを書かないといけない。
  get 'home/about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
