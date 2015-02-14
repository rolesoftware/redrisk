class ActionPlan < ActiveRecord::Base
  belongs_to :risk
  validates :title, presence: true
  validates :term, :finish_date, date: true

  #KIND
  MITIGATION = 0
  TRANSFERENCE = 1
  ELIMINATION = 2
  CONTINGENCY = 3

  def to_kind
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
