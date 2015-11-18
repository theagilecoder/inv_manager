Rails.application.routes.draw do
  root 'static_pages#spage1'
  get  'spage2' => 'static_pages#spage2'
  get 'signup'  => 'users#new'
  resources :users
end