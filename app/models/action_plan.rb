class ActionPlan < ActiveRecord::Base
  belongs_to :risk
  attr_accessible :effective, :title, :kind, :description, :assigned_to, :term, :finish_date
  validates :title, presence: true
  validates :term, :finish_date, date: true
  acts_as_versioned

  #KIND
  MITIGATION = 0
  TRANSFERENCE = 1
  ELIMINATION = 2
  CONTINGENCY = 3

  def self.kind_to_text(kind)
    case kind
      when MITIGATION
        I18n.t('action_plan.kind.mitigation')
      when TRANSFERENCE
        I18n.t('action_plan.kind.transference')
      when ELIMINATION
        I18n.t('action_plan.kind.elimination')
      when CONTINGENCY
        I18n.t('action_plan.kind.contingency')
      else
        ''
    end
  end

end
