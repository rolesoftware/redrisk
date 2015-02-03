module RisksHelper

  def options_for_status
    [[t('risk.status.open'), 0],
     [t('risk.status.closed'),	1],
     [t('risk.status.in_progress'), 2],
     [t('risk.status.suspended'), 3],
     [t('risk.status.canceled'), 4],
     [t('risk.status.rejected'), 5],
     [t('risk.status.resolved'), 6]]
  end

end
