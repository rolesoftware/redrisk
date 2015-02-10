module RisksHelper

  def options_for_origin
    [[t('risk.origin.project'), 0],
     [t('risk.origin.organizational'),	1]]
  end

  def options_for_source
    [[t('risk.source.organizational_environment'), Risk::ORGANIZATIONAL_ENVIRONMENT],
     [t('risk.source.user'), Risk::USER],
     [t('risk.source.requirements'), Risk::REQUIREMENTS],
     [t('risk.source.project_complexity'), Risk::PROJECT_COMPLEXITY],
     [t('risk.source.planning_and_control'), Risk::PLANNING_AND_CONTROL],
     [t('risk.source.team'), Risk::TEAM]
    ]
  end
  def options_for_status
    [[t('risk.status.open'), 0],
     [t('risk.status.closed'),	1],
     [t('risk.status.in_progress'), 2],
     [t('risk.status.suspended'), 3],
     [t('risk.status.canceled'), 4],
     [t('risk.status.rejected'), 5],
     [t('risk.status.resolved'), 6]]
  end

  def options_for_strategy
    [[t('risk.strategy.eliminate'), 0],
     [t('risk.strategy.transfer'),	1],
     [t('risk.strategy.mitigate'), 2],
     [t('risk.strategy.accept'), 3]]
  end

end
