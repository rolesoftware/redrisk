module ActionPlansHelper

  def options_for_kind
    [[t('action_plan.kind.mitigation'), ActionPlan::MITIGATION],
     [t('action_plan.kind.transference'), ActionPlan::TRANSFERENCE],
     [t('action_plan.kind.elimination'), ActionPlan::ELIMINATION],
     [t('action_plan.kind.contingency'), ActionPlan::CONTINGENCY]]
  end
end
