Rails.application.routes.draw do
  get "frontier/total",   :to => "frontiers#total",   :as => 'frontier_total' 
  resources :frontiers
  resources :uploaded_checks
  resources :pre_total_party_nums
  resources :damage_buffers
  get "conditions",   :to => "parameter_developments#conditions",   :as => 'conditions' 
  resources :dices
  resources :parameter_developments
  resources :pre_wins
  resources :damages
  resources :bugs
  resources :command_action_rankings
  resources :command_actions
  resources :facility_uses
  resources :manufactures
  resources :mission_names
  get "mission/statistics",   :to => "missions#statistics",   :as => 'mission_statistics' 
  resources :missions
  resources :meddling_targets
  resources :meddling_success_rates
  get "item_use/total_kakuho",   :to => "item_uses#total_kakuho",   :as => 'item_use_total_kakuho' 
  resources :new_item_uses
  resources :item_uses
  get "training/graph",   :to => "trainings#graph",   :as => 'training_graph' 
  get "training/history", :to => "trainings#history", :as => 'training_history' 
  resources :trainings
  resources :facility_division_data
  resources :new_card_uses
  resources :new_get_cards
  resources :max_chains
  resources :card_use_pages
  get "card_user/sum",     :to => "card_users#sum",     :as => 'card_user_sum' 
  get "card_user/history", :to => "card_users#history", :as => 'card_user_history' 
  resources :card_users
  get "development_result/win_per", :to => "development_results#win_per", :as => 'development_result_win_per' 
  resources :development_results
  resources :places
  resources :facilities
  get "drop_min_subject/select", :to => "drop_min_subjects#select", :as => 'drop_min_subject_select' 
  resources :drop_min_subjects
  get "get_card/drop_subjects",  :to => "get_cards#drop_subjects", :as => 'drop_subjects' 
  resources :get_cards
  resources :cards
  resources :card_data
  resources :items
  get "characteristic/graph",   :to => "characteristics#graph",   :as => 'characteristic_graph' 
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
