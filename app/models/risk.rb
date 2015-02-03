class Risk < ActiveRecord::Base

  #STATUS
  OPEN = 0
  CLOSED = 1
  IN_PROGRESS = 2
  SUSPENDED = 3
  CANCELED = 4
  REJECTED = 5
  RESOLVED = 6

  def to_status
    case status
      when OPEN
        I18n.t('risk.status.open')
      when CLOSED
        I18n.t('risk.status.closed')
      when IN_PROGRESS
        I18n.t('risk.status.in_progress')
      when SUSPENDED
        I18n.t('risk.status.suspended')
      when CANCELED
        I18n.t('risk.status.canceled')
      when REJECTED
        I18n.t('risk.status.rejected')
      when RESOLVED
        I18n.t('risk.status.resolved')
      else
        'error'
    end
  end

end
