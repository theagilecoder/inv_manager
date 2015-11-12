Rails.application.routes.draw do
  root 'static_pages#spage1'
  get  'static_pages/spage2'
end