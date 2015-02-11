module RisksHelper

  def options_for_origin
    [[t('risk.origin.project'), Risk::PROJECT],
     [t('risk.origin.organizational'),	Risk::ORGANIZATIONAL]]
  end

  def options_for_probability
    [[t('risk.probability.very_low'), Risk::VERY_LOW],
     [t('risk.probability.low'), Risk::LOW],
     [t('risk.probability.medium'), Risk::MEDIUM],
     [t('risk.probability.high'), Risk::HIGH],
     [t('risk.probability.very_high'), Risk::VERY_HIGH]]
  end

  def options_for_impact
    [[t('risk.impact.very_low'), Risk::VERY_LOW],
     [t('risk.impact.low'), Risk::LOW],
     [t('risk.impact.medium'), Risk::MEDIUM],
     [t('risk.impact.high'), Risk::HIGH],
     [t('risk.impact.very_high'), Risk::VERY_HIGH]]
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
    [[t('risk.status.open'), Risk::OPEN],
     [t('risk.status.closed'),	Risk::CLOSED],
     [t('risk.status.in_progress'), Risk::IN_PROGRESS],
     [t('risk.status.suspended'), Risk::SUSPENDED],
     [t('risk.status.canceled'), Risk::CANCELED],
     [t('risk.status.rejected'), Risk::REJECTED],
     [t('risk.status.resolved'), Risk::RESOLVED]]
  end

  def options_for_strategy
    [[t('risk.strategy.eliminate'), Risk::ELIMINATE],
     [t('risk.strategy.transfer'),	Risk::TRANSFER],
     [t('risk.strategy.mitigate'), Risk::MITIGATE],
     [t('risk.strategy.accept'), Risk::ACCEPT]]
  end

end
