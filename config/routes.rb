Rails.application.routes.draw do
  root 'static_pages#spage1'
  get 'home' => 'static_pages#spage1'
  get  'spage2' => 'static_pages#spage2'
  get  'spage3' => 'static_pages#spage3'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
  resources :items do
    collection { post :import }
  end  
end