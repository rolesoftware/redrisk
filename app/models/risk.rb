class Risk < ActiveRecord::Base
require 'matrix'
has_many :action_plans
attr_accessible :title, :status, :origin, :effort, :cost, :description, :source, :category, :probability, :impact, :priority, :identification_date, :created_by, :assigned_to, :strategy, :trigger
validates :title, presence: true
validates :identification_date, date: true
acts_as_versioned

  #ORIGIN
  PROJECT = 0
  ORGANIZATIONAL = 1

  # PROBABILITY, IMPACT, PRIORITY
  VERY_LOW = 0
  LOW = 1
  MEDIUM = 2
  HIGH = 3
  VERY_HIGH = 4

  #SOURCE
  ORGANIZATIONAL_ENVIRONMENT = 0
  USER = 1
  REQUIREMENTS = 2
  PROJECT_COMPLEXITY = 3
  PLANNING_AND_CONTROL = 4
  TEAM = 5

  #CATEGORY
  ## ORGANIZATIONAL_ENVIRONMENT
  ORGANIZATIONAL_POLICY = 0
  ORGANIZATIONAL_SUPPORT = 1
  ENVIRONMENT = 2
  ## USER
  USER_INVOLVEMENT = 3
  USER_USER = 4
  ## REQUIREMENTS
  FUNCTIONAL_REQUIREMENTS = 5
  NON_FUNCTIONAL_REQUIREMENTS = 6
  REQUIREMENTS_REQUIREMENTS = 7
  ## PROJECT_COMPLEXITY
  USED_TECHNOLOGY = 8
  PROCESSES = 9
  ## PLANNING_AND_CONTROL
  CHRONOGRAM = 10
  BUDGET = 11
  MILESTONES = 12
  ESTIMATED_DURATION = 13
  MANAGERS = 14
  ## TEAM
  TEAM_INSUFFICIENCY = 15
  KNOWLEDGE = 16
  COOPERATION = 17
  MOTIVATION = 18
  COMMUNICATION = 19

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

  def self.origin_to_text(origin)
    case origin
      when PROJECT
        I18n.t('risk.origin.project')
      when ORGANIZATIONAL
        I18n.t('risk.origin.organizational')
      else
        ''
    end
  end

  def self.probability_to_text(probability)
    case probability
      when VERY_LOW
        I18n.t('risk.probability.very_low')
      when LOW
        I18n.t('risk.probability.low')
      when MEDIUM
        I18n.t('risk.probability.medium')
      when HIGH
        I18n.t('risk.probability.high')
      when VERY_HIGH
        I18n.t('risk.probability.very_high')
      else
        ''
    end
  end

  def self.impact_to_text(impact)
    case impact
      when VERY_LOW
        I18n.t('risk.impact.very_low')
      when LOW
        I18n.t('risk.impact.low')
      when MEDIUM
        I18n.t('risk.impact.medium')
      when HIGH
        I18n.t('risk.impact.high')
      when VERY_HIGH
        I18n.t('risk.impact.very_high')
      else
        ''
    end
  end

  def self.priority_to_text(priority)
    case priority
      when VERY_LOW
        I18n.t('risk.priority.very_low')
      when LOW
        I18n.t('risk.priority.low')
      when MEDIUM
        I18n.t('risk.priority.medium')
      when HIGH
        I18n.t('risk.priority.high')
      when VERY_HIGH
        I18n.t('risk.priority.very_high')
      else
        ''
    end
  end

  def self.source_to_text(source)
    case source
      when ORGANIZATIONAL_ENVIRONMENT
        I18n.t('risk.source.organizational_environment')
      when USER
        I18n.t('risk.source.user')
      when REQUIREMENTS
        I18n.t('risk.source.requirements')
      when PROJECT_COMPLEXITY
        I18n.t('risk.source.project_complexity')
      when PLANNING_AND_CONTROL
        I18n.t('risk.source.planning_and_control')
      when TEAM
        I18n.t('risk.source.team')
      else
        ''
    end
  end

  def self.category_to_text(category)
    case category
      when ORGANIZATIONAL_POLICY
        I18n.t('risk.category.organizational_policy')
      when ORGANIZATIONAL_SUPPORT
        I18n.t('risk.category.organizational_support')
      when ENVIRONMENT
        I18n.t('risk.category.environment')
      when USER_INVOLVEMENT
        I18n.t('risk.category.user_involvement')
      when USER_USER
        I18n.t('risk.category.user_user')
      when FUNCTIONAL_REQUIREMENTS
        I18n.t('risk.category.functional_requirements')
      when NON_FUNCTIONAL_REQUIREMENTS
        I18n.t('risk.category.non_functional_requirements')
      when REQUIREMENTS_REQUIREMENTS
        I18n.t('risk.category.requirements_requirements')
      when USED_TECHNOLOGY
        I18n.t('risk.category.used_technology')
      when PROCESSES
        I18n.t('risk.category.processes')
      when CHRONOGRAM
        I18n.t('risk.category.chronogram')
      when BUDGET
        I18n.t('risk.category.budget')
      when MILESTONES
        I18n.t('risk.category.milestones')
      when ESTIMATED_DURATION
        I18n.t('risk.category.estimated_duration')
      when MANAGERS
        I18n.t('risk.category.managers')
      when TEAM_INSUFFICIENCY
        I18n.t('risk.category.team_insufficiency')
      when KNOWLEDGE
        I18n.t('risk.category.knowledge')
      when COOPERATION
        I18n.t('risk.category.cooperation')
      when MOTIVATION
        I18n.t('risk.category.motivation')
      when COMMUNICATION
        I18n.t('risk.category.communication')
      else
        ''
    end
  end

  def self.status_to_text(status)
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
        ''
    end
  end

  def self.strategy_to_text(strategy)
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
        ''
    end
  end

  def self.get_category_by_source(source_id)
    case source_id
      when ORGANIZATIONAL_ENVIRONMENT
        [[I18n.t('risk.category.organizational_policy'), ORGANIZATIONAL_POLICY],
         [I18n.t('risk.category.organizational_support'), ORGANIZATIONAL_SUPPORT],
         [I18n.t('risk.category.environment'), ENVIRONMENT]]
      when USER
        [[I18n.t('risk.category.user_involvement'), USER_INVOLVEMENT],
         [I18n.t('risk.category.user_user'), USER_USER]]
      when REQUIREMENTS
        [[I18n.t('risk.category.functional_requirements'), FUNCTIONAL_REQUIREMENTS],
         [I18n.t('risk.category.non_functional_requirements'), NON_FUNCTIONAL_REQUIREMENTS],
         [I18n.t('risk.category.requirements_requirements'), REQUIREMENTS_REQUIREMENTS]]
      when PROJECT_COMPLEXITY
        [[I18n.t('risk.category.used_technology'), USED_TECHNOLOGY],
         [I18n.t('risk.category.processes'), PROCESSES]]
      when PLANNING_AND_CONTROL
        [[I18n.t('risk.category.chronogram'), CHRONOGRAM],
         [I18n.t('risk.category.budget'), BUDGET],
         [I18n.t('risk.category.milestones'), MILESTONES],
         [I18n.t('risk.category.estimated_duration'), ESTIMATED_DURATION],
         [I18n.t('risk.category.managers'), MANAGERS]]
      when TEAM
        [[I18n.t('risk.category.team_insufficiency'), TEAM_INSUFFICIENCY],
         [I18n.t('risk.category.knowledge'), KNOWLEDGE],
         [I18n.t('risk.category.cooperation'), COOPERATION],
         [I18n.t('risk.category.motivation'), MOTIVATION],
         [I18n.t('risk.category.communication'), COMMUNICATION]]
      else
        []
    end
  end

  def self.get_priority_by_probability_and_impact(probability_id, impact_id)

    priority_matrix = Matrix[ [VERY_LOW, VERY_LOW, LOW, MEDIUM, MEDIUM],
                              [VERY_LOW, LOW, MEDIUM, MEDIUM, HIGH],
                              [VERY_LOW, LOW, MEDIUM, HIGH, HIGH],
                              [LOW, MEDIUM, HIGH, HIGH, VERY_HIGH],
                              [LOW, HIGH, VERY_HIGH, VERY_HIGH, VERY_HIGH]]

    priority = priority_matrix[probability_id, impact_id]
    case priority
      when VERY_LOW
        [I18n.t('risk.priority.very_low'), VERY_LOW]
      when LOW
        [I18n.t('risk.priority.low'), LOW]
      when MEDIUM
        [I18n.t('risk.priority.medium'), MEDIUM]
      when HIGH
        [I18n.t('risk.priority.high'), HIGH]
      when VERY_HIGH
        [I18n.t('risk.priority.very_high'), VERY_HIGH]
      else
        []
    end

  end

end
