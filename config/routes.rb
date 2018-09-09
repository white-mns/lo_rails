Rails.application.routes.draw do
  resources :places
  resources :facilities
  get "drop_min_subject/select", :to => "drop_min_subjects#select", :as => 'drop_min_subject_select' 
  resources :drop_min_subjects
  get "get_card/drop_subjects",  :to => "get_cards#drop_subjects", :as => 'drop_subjects' 
  resources :get_cards
  resources :cards
  resources :card_data
  resources :items
  resources :characteristics
  resources :parameter_progresses
  resources :parameter_controls
  resources :parameter_fights
  resources :subjects
  get "pgws/graph",   :to => "pgws#graph",    :as => 'pgws_graph' 
  resources :pgws
  get "profile/pgws", :to => "profiles#pgws", :as => 'profile_pgws' 
  resources :profiles
  resources :proper_names
  resources :names
  get 'top_page/privacy'
  root 'top_page#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
