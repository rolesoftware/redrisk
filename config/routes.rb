# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
# resources :risks
# resources :action_plans

get 'projects/:id/risks', to: 'risks#index', as: :risks
post 'projects/:id/risks', to: 'risks#create', as: :create_risk
get 'projects/:id/risks/new', to: 'risks#new', as: :new_risk
get 'projects/:id/risks/:risk_id/edit', to: 'risks#edit', as: :edit_risk
get 'projects/:id/risks/:risk_id', to: 'risks#show', as: :show_risk
put 'projects/:id/risks/:risk_id', to: 'risks#update', as: :update_risk
delete 'projects/:id/risks/:risk_id', to: 'risks#destroy', as: :destroy_risk

get 'projects/:id/risks/action_plans', to: 'action_plans#index', as: :action_plans
post 'projects/:id/risks/:risk_id/action_plans', to: 'action_plans#create', as: :create_action_plan
get 'projects/:id/risks/:risk_id/action_plans/new', to: 'action_plans#new', as: :new_action_plan
get 'projects/:id/risks/action_plans/:action_plan_id/edit', to: 'action_plans#edit', as: :edit_action_plan
get 'projects/:id/risks/action_plans/:action_plan_id', to: 'action_plans#show', as: :show_action_plan
put 'projects/:id/risks/action_plans/:action_plan_id', to: 'action_plans#update', as: :update_action_plan
delete 'projects/:id/risks/action_plans/:action_plan_id', to: 'action_plans#destroy', as: :destroy_action_plan

