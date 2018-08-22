Rails.application.routes.draw do
  resources :pgws
  resources :profiles
  resources :proper_names
  resources :names
  get 'top_page/privacy'
  root 'top_page#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
