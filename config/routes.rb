Rails.application.routes.draw do
  resources :parameter_controls
  resources :parameter_fights
  resources :subjects
  get "pgws/graph", 	    :to => "pgws#graph",	    :as => 'pgws_graph' 
  resources :pgws
  get "profile/pgws", 	    :to => "profiles#pgws",	    :as => 'profile_pgws' 
  resources :profiles
  resources :proper_names
  resources :names
  get 'top_page/privacy'
  root 'top_page#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
