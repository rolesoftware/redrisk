class Risk < ActiveRecord::Base

  #ORIGIN
  PROJECT = 0
  ORGANIZATIONAL = 1

  #STATUS
  OPEN = 0
  CLOSED = 1
  IN_PROGRESS = 2
  SUSPENDED = 3
  CANCELED = 4
  REJECTED = 5
  RESOLVED = 6

  #STRATEGY
  ELIMINATE = 0
  TRANSFER = 1
  MITIGATE = 2
  ACCEPT = 3

  def to_origin
    case origin
      when PROJECT
        I18n.t('risk.origin.project')
      when ORGANIZATIONAL
        I18n.t('risk.origin.organizational')
      else
        'error'
    end
  end

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

  def to_strategy
    case strategy
      when ELIMINATE
        I18n.t('risk.strategy.eliminate')
      when TRANSFER
        I18n.t('risk.strategy.transfer')
      when MITIGATE
        I18n.t('risk.strategy.mitigate')
      when ACCEPT
        I18n.t('risk.strategy.accept')
      else
        'error'
    end
  end

end
