class ActionPlan < ActiveRecord::Base
  belongs_to :risk
  attr_accessible :assigned_to, :description, :effective, :finish_date, :kind, :risk_id, :term, :title
end
