# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
# resources :risks
resources :action_plans

get 'projects/:id/risks', to: 'risks#index', as: :risks
post 'projects/:id/risks', to: 'risks#create', as: :create_risk
get 'projects/:id/risks/new', to: 'risks#new', as: :new_risk
get 'projects/:id/risks/:risk_id/edit', to: 'risks#edit', as: :edit_risk
get 'projects/:id/risks/:risk_id', to: 'risks#show', as: :show_risk
put 'projects/:id/risks/:risk_id', to: 'risks#update', as: :update_risk
delete 'projects/:id/risks/:risk_id', to: 'risks#destroy', as: :destroy_risk
