class ActionPlan < ActiveRecord::Base
  attr_accessible :assigned_to, :description, :effective, :finish_date, :kind, :risk_id, :term, :title
end
